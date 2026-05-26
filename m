Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E82DB78B;
	Tue, 26 May 2026 01:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779760075; cv=none; b=AHCsLZzHkeDKszBiseBqXeikvunz220pr2PBVHI0Ic6rCYpRWyo5yeH2F62eq9UwsExUQi2bPHbKI5/RXotn+9G7VHRQPg8VIwh7Kg23kPGjDI8ypQpcT/55hqNm48Lr2LcrWJbqV21YbcCYNWhnR7/PYP1cjdF/i014RvKndpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779760075; c=relaxed/simple;
	bh=rRPnsbl60pOsDTOA50lTT8Us6Z2f7TlJqKQ0AejDsFs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isSUjgNv1ZdK0N9QGKsrOCGxEqEU8vh8i5V6Nd1CEiyY+qPCx+k8yn4dDjnW5M9JDuRin10Vkk/XoHtP6FoHl913tVIksO5QsWWXDUjSXCbWLMBl/TvGGAQoduOo5td45iuyxDBLDaDyRjI8UGVvyS9kUDpLVfZMwb/2sgI9OCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WiDB+zWS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WiDB+zWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779760068; x=1811296068;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rRPnsbl60pOsDTOA50lTT8Us6Z2f7TlJqKQ0AejDsFs=;
  b=WiDB+zWSx9nX5gK8O0quj7a+4S6cJFbSbURXV8FRBSNBz2gdC/swLaTo
   TaH2xHfFf/eoCu5MesVj24ZWnau+wjGqt+DBL+9UtdHKt5QOtfvgnTUKv
   tSKnoxRftJyjOvJNkGbiE35KhasvjLLvbBd8XdZgeMpMMa1o+ubLHsWpT
   2VZK9smHvjwoIvdBaq2E2c8wKaCZsFuXBW0fZOih28pvMasa/mOjDYhjw
   mIht3qB79S3YY3jEluJ6j7NLhRsfOgAc8N3JeyLVAi9H1pYbtYc56quzh
   jaw5XRL+xj5s2tdx2wjQp1/Nnns9bk3aGeGs0qMzx0Y0TAqYGIC+/7rXX
   A==;
X-CSE-ConnectionGUID: BhlsjWuCQo2aNNmFuLfs5Q==
X-CSE-MsgGUID: dxH4Gt6CQyW1Y4/3TH8EhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80539894"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="80539894"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
X-CSE-ConnectionGUID: PrROR28dQGu3ha+mugu22A==
X-CSE-MsgGUID: CPhBUBxESX6KTLvXNML1Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="272074977"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 18:47:33 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 09/17] tools/arch/x86/pmtctl: Add libpmtctl Makefile + pc + README
Date: Mon, 25 May 2026 18:47:07 -0700
Message-ID: <20260526014719.2248380-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526014719.2248380-1-david.e.box@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add build infrastructure for libpmtctl_core, allowing the library to be
built standalone and consumed by downstream tools via pkg-config.

Provide separate release and debug build variants so optimized and
development builds can coexist within the same checkout without
overwriting each other.

JSON metric definition support is optional at build time. When built with
HAVE_JANSSON, the JSON metric provider is enabled and linked against
libjansson. Otherwise, JSON-backed metric loading remains unavailable and
pmt_metrics_load() returns PMTCTL_ERR_UNSUPPORTED for non-NULL path
arguments.

Add a pkg-config template for discovering the library's compile and link
flags, along with a README describing the library purpose and build
options.

Assisted-by: GitHub-Copilot:claude-sonnet-4.6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 tools/arch/x86/pmtctl/lib/Makefile         | 108 +++++++++++++++++++
 tools/arch/x86/pmtctl/lib/README           | 116 +++++++++++++++++++++
 tools/arch/x86/pmtctl/libpmtctl-core.pc.in |  11 ++
 3 files changed, 235 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/lib/Makefile
 create mode 100644 tools/arch/x86/pmtctl/lib/README
 create mode 100644 tools/arch/x86/pmtctl/libpmtctl-core.pc.in

diff --git a/tools/arch/x86/pmtctl/lib/Makefile b/tools/arch/x86/pmtctl/lib=
/Makefile
new file mode 100644
index 000000000000..e2aeff1935cf
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/Makefile
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+CC      :=3D gcc
+AR      :=3D ar
+RANLIB  :=3D ranlib
+
+BUILD ?=3D release
+
+CPPFLAGS +=3D -I../include -I../../../../include -D_GNU_SOURCE
+CFLAGS   +=3D -std=3Dgnu11 -Wall -Wextra
+
+WEXTRA_WARN :=3D -Wpedantic -Wmissing-prototypes -Wstrict-prototypes \
+               -Wunused-function -Wunused-variable -Wunused-parameter \
+               -Wunused-but-set-variable -Wunreachable-code
+
+ifeq ($(BUILD),debug)
+  CFLAGS +=3D -O0 -g3 -fno-omit-frame-pointer
+  CFLAGS +=3D $(WEXTRA_WARN)
+  CPPFLAGS +=3D -DDEBUG
+else ifeq ($(BUILD),release)
+  CFLAGS +=3D -O2 -g0 -DNDEBUG
+else
+  $(error unknown BUILD '$(BUILD)' (use release or debug))
+endif
+
+BUILDDIR :=3D ../build/$(BUILD)/lib
+CORE_TARGET :=3D $(BUILDDIR)/libpmtctl_core.a
+
+CORE_SRC :=3D \
+	log.c \
+	common.c \
+	device_telem.c \
+	metrics_db.c \
+	pmt_guid.c \
+	pmtctl.c \
+	metrics_provider.c \
+	builtin_defs_empty.c
+
+HAVE_JANSSON ?=3D 0
+ifeq ($(HAVE_JANSSON),1)
+  CORE_SRC  +=3D metrics_provider_json.c
+  CPPFLAGS  +=3D -DHAVE_JANSSON
+  LDLIBS    +=3D -ljansson
+endif
+
+CORE_OBJ :=3D $(patsubst %.c,$(BUILDDIR)/%.o,$(CORE_SRC))
+
+PREFIX ?=3D /usr/local
+DESTDIR ?=3D
+INCLUDEDIR ?=3D $(PREFIX)/include/pmtctl
+LIBINSTALLDIR ?=3D $(PREFIX)/lib
+PKGCONFIGDIR ?=3D $(LIBINSTALLDIR)/pkgconfig
+
+PC_CORE :=3D ../libpmtctl-core.pc
+PC_FILES :=3D $(PC_CORE)
+
+PUBLIC_HEADERS :=3D \
+	../include/lib/pmtctl.h \
+	../include/lib/metrics_db.h \
+	../include/lib/pmt_guid.h \
+	../include/lib/device.h
+
+.PHONY: all clean install install-lib install-headers install-pkgconfig un=
install uninstall-lib uninstall-headers uninstall-pkgconfig
+
+all: $(CORE_TARGET)
+
+$(CORE_TARGET): $(CORE_OBJ)
+	$(AR) rcs $@ $(CORE_OBJ)
+	$(RANLIB) $@
+
+$(PC_CORE): ../libpmtctl-core.pc.in
+	@sed -e 's|@PREFIX@|$(PREFIX)|g' \
+	     -e 's|@JANSSON_LIBS@|$(if $(filter 1,$(HAVE_JANSSON)), -ljansson,)|g=
' \
+	     $< > $@
+
+$(BUILDDIR)/%.o: %.c
+	@mkdir -p $(BUILDDIR)
+	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@
+
+install: all install-lib install-headers install-pkgconfig
+
+install-lib: all
+	install -d $(DESTDIR)$(LIBINSTALLDIR)
+	install -m 0644 $(CORE_TARGET) $(DESTDIR)$(LIBINSTALLDIR)
+
+install-headers:
+	install -d $(DESTDIR)$(INCLUDEDIR)
+	install -m 0644 $(PUBLIC_HEADERS) $(DESTDIR)$(INCLUDEDIR)
+
+install-pkgconfig: $(PC_FILES)
+	install -d $(DESTDIR)$(PKGCONFIGDIR)
+	install -m 0644 $(PC_FILES) $(DESTDIR)$(PKGCONFIGDIR)
+
+uninstall: uninstall-lib uninstall-headers uninstall-pkgconfig
+
+uninstall-lib:
+	rm -f $(DESTDIR)$(LIBINSTALLDIR)/libpmtctl_core.a
+
+uninstall-headers:
+	rm -f $(DESTDIR)$(INCLUDEDIR)/pmtctl.h
+	rm -f $(DESTDIR)$(INCLUDEDIR)/metrics_db.h
+	rm -f $(DESTDIR)$(INCLUDEDIR)/device.h
+
+uninstall-pkgconfig:
+	rm -f $(DESTDIR)$(PKGCONFIGDIR)/libpmtctl-core.pc
+
+clean:
+	rm -rf $(BUILDDIR) $(PC_FILES)
diff --git a/tools/arch/x86/pmtctl/lib/README b/tools/arch/x86/pmtctl/lib/R=
EADME
new file mode 100644
index 000000000000..60f7de8c2256
--- /dev/null
+++ b/tools/arch/x86/pmtctl/lib/README
@@ -0,0 +1,116 @@
+libpmtctl_core usage notes
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+Overview
+--------
+libpmtctl_core provides PMT device enumeration, metric loading, and
+metric-to-device binding services used by pmtctl and other PMT tools.
+
+Public headers installed by lib/Makefile:
+- include/lib/pmtctl.h
+- include/lib/metrics_db.h
+- include/lib/device.h
+
+Typical flow
+------------
+1) Prepare options (struct pmt_global_opts).
+2) Optionally set log verbosity with pmtctl_set_log_level().
+3) Call pmtctl_init(&opts).
+4) Query context/counts and perform selection/reads through public APIs.
+5) Call pmtctl_cleanup() before exit.
+
+API reference
+-------------
+Initialization and lifecycle:
+- int pmtctl_init(const struct pmt_global_opts *gopts)
+	Initializes library-global PMT context. Enumerates devices,
+	and loads metric definitions. Returns 0 on success or a non-zero error co=
de.
+
+- void pmtctl_cleanup(void)
+	Releases library-global resources allocated by pmtctl_init(). Safe to call
+	as part of normal shutdown after successful or partially successful init.
+
+- PMTCTL_SCOPE_GUARD
+	Cleanup helper macro that arranges pmtctl_cleanup() to run automatically
+	when the current scope exits.
+
+Context and counts:
+- const struct pmtctl_context *pmtctl_get_ctx(void)
+	Returns pointer to current library-global context.
+
+- enum pmt_device_type pmtctl_get_device_type(void)
+	Returns selected backend/device type for current context.
+
+- int pmtctl_get_num_devices(void)
+	Returns number of enumerated devices in current context.
+
+- int pmtctl_get_num_metrics(void)
+	Returns number of loaded metric definitions.
+
+- int pmtctl_get_num_bindings(void)
+	Returns number of metric-to-device bindings currently available.
+
+Logging:
+- void pmtctl_set_log_level(enum pmtctl_log_level level)
+	Sets process-global logging verbosity used by libpmtctl_core.
+	Clamp behavior: invalid/out-of-range values are clamped to
+	PMTCTL_LOG_INFO.
+
+Device selection helpers:
+- int pmtctl_parse_ep_selector(const char *s,
+                              struct pmt_ep_selector *out)
+       Parses a selector string (for example: guid=3D27971628, ep=3Dpmt_ep=
_...)
+       into structured selector fields.
+
+- int pmt_select_devices(const struct pmtctl_context *ctx,
+                        const struct pmt_ep_selector *sel,
+                        int *out_idx, int max_out)
+	Filters context devices using selector criteria and writes matching device
+	indexes into out_idx. Returns number of matches (0 means no matches).
+
+Log level behavior
+------------------
+pmtctl_set_log_level(enum pmtctl_log_level level)
+- Accepted levels:
+  PMTCTL_LOG_ERROR
+  PMTCTL_LOG_WARN
+  PMTCTL_LOG_INFO
+  PMTCTL_LOG_DEBUG
+- Clamp policy:
+  Invalid/out-of-range values are clamped to PMTCTL_LOG_INFO.
+
+Thread-safety
+-------------
+libpmtctl_core is generally not thread-safe.
+
+In particular, library-global state is used for:
+- PMT context/session ownership
+- logging verbosity
+
+Callers should serialize calls that operate on shared library state,
+including pmtctl_init(), pmtctl_cleanup(), and other APIs that consume
+or mutate global context.
+
+Minimal example
+---------------
+#include "lib/pmtctl.h"
+
+int run(void)
+{
+	struct pmt_global_opts opts =3D {
+		.json_path =3D NULL,
+		.device_selector =3D NULL,
+		.quiet =3D false,
+		.debug =3D false,
+	};
+
+	pmtctl_set_log_level(PMTCTL_LOG_INFO);
+
+	if (pmtctl_init(&opts) !=3D 0)
+		return -1;
+
+	/* ... use library APIs ... */
+
+	pmtctl_cleanup();
+	return 0;
+}
diff --git a/tools/arch/x86/pmtctl/libpmtctl-core.pc.in b/tools/arch/x86/pm=
tctl/libpmtctl-core.pc.in
new file mode 100644
index 000000000000..0cbc9127d686
--- /dev/null
+++ b/tools/arch/x86/pmtctl/libpmtctl-core.pc.in
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+prefix=3D@PREFIX@
+exec_prefix=3D${prefix}
+libdir=3D${exec_prefix}/lib
+includedir=3D${prefix}/include
+
+Name: libpmtctl-core
+Description: Intel PMT core access library (transport/enumeration/bindings)
+Version: 0.1
+Libs: -L${libdir} -lpmtctl_core @JANSSON_LIBS@
+Cflags: -I${includedir}/pmtctl
--=20
2.43.0

