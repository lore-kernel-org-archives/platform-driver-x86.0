Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667864963C1
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575250; cv=none; b=MALhiagXu3JTJapxm2U8PKLNR7iDDbyuvtznHBh8osL3ph/ttmHpwRw9QElZsboleOdfkW+I8fj24QLqfd2fjxuBJa+YArfxBG+8ECuJOrzn3BQE6ODbSXhFYHtIhH8FFgL6gfeSZzZ5mMSkTBHZ08rALy8OB4Ue5QQHNuA+994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575250; c=relaxed/simple;
	bh=5FNpAGUCE+n9PljeCkXsU6XTSJtv8S6GdPImyyDNYug=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DC+XRFfxvyFjbn7zml9BPNI2AAMjLHe7Fpu+KRtltlcR3b+njpqGh1LhJjjzK2hdDmC6oYaPHIDVpXPl3PD8iSF8kGL7hU4zFb5KMO11fGnwvlmap+HLAOYMtiRBLpUE4/UlvnLi85BipGf2boDNwNVCvonQbNMAB5iLyQLU9hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=m92O9k5Q; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="m92O9k5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778575235; x=1778834435;
	bh=RHPwAqGvxbrntkywrX7FlkwyjjAJDmjo8jpMTkDe/gI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m92O9k5QN49amwrkdZNz2qXXlQBEthBMVOJEQQQLSTkTbYpzUDEIP/TGygPWwgFit
	 9N7MKQk/ydscEeyVb7cqfb2udh0miypxvv51S4wpx8oL2peYOe5d5yFs6N2gRv2BL6
	 AH9fyjZnaDnMIT2J0iyMCNowkQ1W0OXabRRdIHkPkIenaW8ixSsw2eoYB7LtFliePe
	 QomOZ0pdxyiBOa+kvfo3uBnNMWIhQtrHaj4JTtLpDDd+9K5HybWS8qLBtEKpHGBseS
	 ygYr5qbxJ7ZVeLfE/NkTFMYtwq5ahvGvGGUWNjtFBukjeAVSPTKNhQ4dwsnffhdaQP
	 kJdZqKi4nkVqQ==
Date: Tue, 12 May 2026 08:40:30 +0000
To: srinivas.pandruvada@linux.intel.com, fabio.m.de.francesco@linux.intel.com, rafael@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: noor.u.mubeen@intel.com, vinod.gomathinayagam@intel.com, deepak.sundar@intel.com, mohsin.shariff@intel.com, kloczek@github.com, xiaqinxin@huawei.com, jack@jackkelly.name, rui.zhang@intel.com, baohua@kernel.org, colin.i.king@gmail.com, libin3479@gmail.com, m.szyprowski@samsung.com, ali.erdinc.koroglu@intel.com, admin@ptr1337.dev, maciej.wieczor-retman@intel.com, venkatesh.j@intel.com, ThatQubicFox@protonmail.com, trenn@suse.de, jengelh@inai.de, robert.dower@intel.com, hpa@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v1 2/3] tools/LPMD: Add Makefile
Message-ID: <ef35be059f031e535cb4edf59f61e305330d3d14.1778560215.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1778560215.git.m.wieczorretman@pm.me>
References: <cover.1778560215.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: eedfbdf3dc77cef6c7caa608b5e54ada0521e99d
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>

The Makefile builds both intel_lpmd and intel_lpmd_control, generates
config.h and lpmd-resource.c at build time, and installs binaries,
systemd unit, D-Bus policy, and XML configuration files.

The build warns and fails if the dependencies listed in
tools/power/x86/intel-lpmd/README.md are not installed.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
Tested-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 tools/power/x86/intel-lpmd/Makefile | 155 ++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)
 create mode 100644 tools/power/x86/intel-lpmd/Makefile

diff --git a/tools/power/x86/intel-lpmd/Makefile b/tools/power/x86/intel-lp=
md/Makefile
new file mode 100644
index 000000000000..de7c744ce656
--- /dev/null
+++ b/tools/power/x86/intel-lpmd/Makefile
@@ -0,0 +1,155 @@
+# SPDX-License-Identifier: GPL-2.0
+include ../../../scripts/Makefile.include
+
+# Install paths (matching automake defaults)
+prefix          ?=3D /usr/local
+sbindir         ?=3D $(prefix)/sbin
+confdir         ?=3D $(prefix)/etc/intel_lpmd
+rundir          ?=3D $(prefix)/var/run/intel_lpmd
+systemd_unitdir ?=3D /usr/lib/systemd/system
+dbus_sysdir     ?=3D /etc/dbus-1/system.d
+
+ifeq ($(srctree),)
+srctree :=3D $(patsubst %/,%,$(dir $(CURDIR)))
+srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
+srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
+srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
+endif
+
+# Do not use make's built-in rules
+MAKEFLAGS +=3D -r
+
+VERSION =3D 0.1.0
+
+# pkg-config dependencies
+ifeq ($(shell pkg-config --exists glib-2.0 gio-2.0 gio-unix-2.0 gmodule-2.=
0 && echo yes),yes)
+  GLIB_CFLAGS :=3D $(shell pkg-config --cflags glib-2.0 gio-2.0 gio-unix-2=
.0 gmodule-2.0)
+  GLIB_LIBS   :=3D $(shell pkg-config --libs   glib-2.0 gio-2.0 gio-unix-2=
.0 gmodule-2.0)
+else
+  $(error No glib-2.0 pkg-config found, please install libglib2.0-dev/glib=
2-devel)
+endif
+
+ifeq ($(shell pkg-config --exists libxml-2.0 && echo yes),yes)
+  XML2_CFLAGS :=3D $(shell pkg-config --cflags libxml-2.0)
+  XML2_LIBS   :=3D $(shell pkg-config --libs   libxml-2.0)
+else
+  $(error No libxml-2.0 pkg-config found, please install libxml2-dev/libxm=
l2-devel)
+endif
+
+ifeq ($(shell pkg-config --exists upower-glib && echo yes),yes)
+  UPOWER_CFLAGS :=3D $(shell pkg-config --cflags upower-glib)
+  UPOWER_LIBS   :=3D $(shell pkg-config --libs   upower-glib)
+else
+  $(error No upower-glib pkg-config found, please install libupower-glib-d=
ev/upower-devel)
+endif
+
+ifeq ($(shell pkg-config --exists libnl-3.0 libnl-genl-3.0 && echo yes),ye=
s)
+  NL3_CFLAGS :=3D $(shell pkg-config --cflags libnl-3.0 libnl-genl-3.0)
+  NL3_LIBS   :=3D $(shell pkg-config --libs   libnl-3.0 libnl-genl-3.0)
+else
+  $(error No libnl-3.0 pkg-config found, please install libnl-3-dev libnl-=
genl-3-dev/libnl3-devel)
+endif
+
+ifeq ($(shell pkg-config --exists libsystemd && echo yes),yes)
+  SYSTEMD_CFLAGS :=3D $(shell pkg-config --cflags libsystemd)
+  SYSTEMD_LIBS   :=3D $(shell pkg-config --libs   libsystemd)
+else
+  $(error No libsystemd pkg-config found, please install libsystemd-dev/sy=
stemd-devel)
+endif
+
+override CFLAGS +=3D -O2 -Wall -g -DGDBUS=3D1 \
+=09-DGLIB_SUPPORT \
+=09-DGETTEXT_PACKAGE=3D\"intel_lpmd\" \
+=09-DPACKAGE_VERSION=3D\"$(VERSION)\" \
+=09-DTDCONFDIR=3D\"$(confdir)\" \
+=09-DTDRUNDIR=3D\"$(rundir)\" \
+=09-DTDLOCALEDIR=3D\"$(prefix)/share/locale\" \
+=09-I. -Isrc/include -Isrc/wlt_proxy/include \
+=09$(GLIB_CFLAGS) $(XML2_CFLAGS) $(UPOWER_CFLAGS) $(NL3_CFLAGS) $(SYSTEMD_=
CFLAGS)
+
+override LDFLAGS +=3D \
+=09$(GLIB_LIBS) $(XML2_LIBS) $(UPOWER_LIBS) $(NL3_LIBS) $(SYSTEMD_LIBS) -l=
m
+
+# Source files
+LPMD_SRCS =3D \
+=09src/lpmd_cgroup.c \
+=09src/lpmd_config.c \
+=09src/lpmd_cpu.c \
+=09src/lpmd_cpumask.c \
+=09src/lpmd_dbus_server.c \
+=09src/lpmd_helpers.c \
+=09src/lpmd_hfi.c \
+=09src/lpmd_irq.c \
+=09src/lpmd_main.c \
+=09src/lpmd_misc.c \
+=09src/lpmd_proc.c \
+=09src/lpmd_socket.c \
+=09src/lpmd_state_machine.c \
+=09src/lpmd_uevent.c \
+=09src/lpmd_util.c \
+=09src/lpmd_wlt.c \
+=09src/wlt_proxy/spike_mgmt.c \
+=09src/wlt_proxy/state_machine.c \
+=09src/wlt_proxy/state_manager.c \
+=09src/wlt_proxy/state_util.c \
+=09src/wlt_proxy/wlt_proxy.c
+
+LPMD_OBJS =3D $(LPMD_SRCS:.c=3D.o) lpmd-resource.o
+CTRL_OBJS =3D tools/intel_lpmd_control.o
+
+ALL_TARGETS :=3D intel_lpmd intel_lpmd_control
+ALL_PROGRAMS :=3D $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
+
+all: $(ALL_PROGRAMS)
+
+# Generated files
+config.h: FORCE
+=09$(QUIET_GEN)echo '/* Auto-generated - do not edit */' > $@ && \
+=09echo '#define GDBUS 1' >> $@ && \
+=09echo '#define GETTEXT_PACKAGE "intel_lpmd"' >> $@ && \
+=09echo '#define PACKAGE_VERSION "$(VERSION)"' >> $@
+
+lpmd-resource.c: lpmd-resource.gresource.xml src/intel_lpmd_dbus_interface=
.xml
+=09$(QUIET_GEN)glib-compile-resources --sourcedir=3D. --generate-source \
+=09=09--target=3D$@ $<
+
+prepare: config.h lpmd-resource.c
+
+%.o: %.c | prepare
+=09$(Q)mkdir -p $(dir $@)
+=09$(QUIET_CC)$(CC) $(CFLAGS) -c -o $@ $<
+
+$(OUTPUT)intel_lpmd: $(LPMD_OBJS)
+=09$(QUIET_LINK)$(CC) $(CFLAGS) $^ $(LDFLAGS) -o $@
+
+$(OUTPUT)intel_lpmd_control: $(CTRL_OBJS)
+=09$(QUIET_LINK)$(CC) $(CFLAGS) $< $(GLIB_LIBS) -o $@
+
+DATA_CONFIGS =3D \
+=09data/intel_lpmd_config.xml \
+=09data/intel_lpmd_config_examples.xml \
+=09data/intel_lpmd_config_experimental.xml \
+=09data/intel_lpmd_config_F6_M170.xml \
+=09data/intel_lpmd_config_F6_M189.xml \
+=09data/intel_lpmd_config_F6_M204.xml
+
+install: $(ALL_PROGRAMS)
+=09install -d -m 755 $(DESTDIR)$(sbindir)
+=09install $(OUTPUT)intel_lpmd $(DESTDIR)$(sbindir)
+=09install $(OUTPUT)intel_lpmd_control $(DESTDIR)$(sbindir)
+=09install -d -m 755 $(DESTDIR)$(confdir)
+=09install -m 644 $(DATA_CONFIGS) $(DESTDIR)$(confdir)
+=09install -d -m 755 $(DESTDIR)$(rundir)
+=09install -d -m 755 $(DESTDIR)$(systemd_unitdir)
+=09sed 's|@sbindir@|$(sbindir)|g' data/intel_lpmd.service.in > \
+=09=09$(DESTDIR)$(systemd_unitdir)/intel_lpmd.service
+=09install -d -m 755 $(DESTDIR)$(dbus_sysdir)
+=09install -m 644 data/org.freedesktop.intel_lpmd.conf $(DESTDIR)$(dbus_sy=
sdir)
+
+clean:
+=09rm -f $(ALL_PROGRAMS) config.h lpmd-resource.c
+=09find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
+
+FORCE:
+
+.PHONY: all install clean FORCE prepare
--=20
2.53.0


