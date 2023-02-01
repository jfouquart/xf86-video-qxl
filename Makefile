# $FreeBSD$

PORTNAME=	xf86-video-qxl
DISTVERSION=	0.1.6
CATEGORIES=	x11-drivers

MAINTAINER=	x11@FreeBSD.org
COMMENT=	X.Org X server -- QXL display driver

LICENSE=	MIT

BUILD_DEPENDS=	spice-protocol>=0.12.10:devel/spice-protocol \
		${LOCALBASE}/include/linux/input.h:devel/evdev-proto
LIB_DEPENDS=	libspice-server.so:devel/libspice-server

USES=		localbase:ldflags pkgconfig python shebangfix shebangfix xorg \
		xorg-cat:driver
USE_XORG=	xfont

USE_GITLAB=	yes
GL_COMMIT=	f6f75e1b03ca0d25d546cf9e80d0317bd644bc8d

CONFIGURE_ARGS+=--enable-xspice

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/X11/xorg.conf.d
	${INSTALL_DATA} ${WRKSRC}/examples/spiceqxl.xorg.conf.example \
		${STAGEDIR}${PREFIX}/etc/X11/xorg.conf.d/spiceqxl.xorg.conf.example

.include <bsd.port.mk>
