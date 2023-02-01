# $FreeBSD$

PORTNAME=	xf86-video-qxl
DISTVERSION=	0.1.5.99
CATEGORIES=	x11-drivers

MAINTAINER=	x11@FreeBSD.org
COMMENT=	X.Org X server -- QXL display driver

LICENSE=	MIT

BUILD_DEPENDS=	spice-protocol>=0.12.10:devel/spice-protocol \
		${LOCALBASE}/include/linux/input.h:devel/evdev-proto
LIB_DEPENDS=	libspice-server.so:devel/libspice-server

USES=		localbase:ldflags pkgconfig shebangfix xorg \
		xorg-cat:driver
USE_XORG=	xfont

USE_GITLAB=	yes
GL_COMMIT=	52e975263fe88105d151297768c7ac675ed94122

CONFIGURE_ARGS+=--disable-xspice

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/X11/xorg.conf.d
	${INSTALL_DATA} ${WRKSRC}/examples/spiceqxl.xorg.conf.example \
		${STAGEDIR}${PREFIX}/etc/X11/xorg.conf.d/spiceqxl.xorg.conf.example

.include <bsd.port.mk>
