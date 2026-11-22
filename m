Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376061;
	b=Zxro1QiJdfKnFKfmDJyagP/Aja/c0oWCP5rp/MDjpGOK6m+RwvblUBb1Mtm91REAPYNP
	 sAwk06RJUUVZpGagY/JQBhQOD+zRUBOZjMiT4hjpmsHGpAHpRGiLD1V876/s7xYsg1TGB
	 Q6+3TQJV+bFuv482cmV4cGmlvhhEfFhz7qFiN5SAXHM4/9gmLAQEs92MhT6OEZcX5z+up
	 64xTj4NzXRi0KeVsI8wJ7aJ0pr8EQDYARhEMq18KaIJolM3xgHZADAXkIe/Rio5yUWisW
	 vfNU3Hn2K42bwWl4t272FTvXijF/rMP3jMZV9+5piZYDl5y7ivFNuKC6TYXwUxzoV2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376061;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=H4TarzeyH5qu+GIwDF1jfI83SrY4JzfpWABfYv3yCjM=;
	b=5gr6oOhAGiEyKwI24s5/wJ93zERncDi6XmSTCZx0DxzPImKEUqPgbjKjU1sE86VVGboL
	 1TPKzhsbvi+mWnUDMXGpj16Ut6O/T4fHxYV+D5DCFUnFzHZrcHFNisRswj7zJQah7WGnK
	 /APEE+cXcCVmmDByiVvRIItCEwqsva6tY62+suLSb6+4ugyhZpyJkaZSJ4PclBr5/aBfL
	 cbK8ntPIouTlFnYntWyjqVSf/V+Ieh2k/I6f5PL5RriHuvSHjnipERd0tWy1GnjzyW3v8
	 ioTeOimod4pb1v3dwNSQlHc7+3wzvV2WMbO7qUPNIVMbPGPMgRSqVTwymXsyx4zgqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="N2/RgAj8";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B25606A687;
	Sun, 22 Nov 2026 19:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B25606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N2/RgAj8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376060; x=1826912060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UXDDUD5g74yKM9r7RcyqBcygNztCv1XOVouVA3/BrLE=;
  b=N2/RgAj8wQ2zS0rp5sFJ5sYR5Sm6K0USMf0MMvH9gnSzIdyCagt6FRhX
   zwgIyihDaMYIOG+XR9Z3YhRlMiH2kxMY5rIu6QelTNR0W55kLw5Av9HJB
   DgOGFT/gshrbqS71Wr6ALsXNvJeNBm75f8yjRfxBxWy4HL45VhmlzSeh1
   e51OJ5MiAjK/v3koxmBXGd2iHbHn2Cas2Eeh51Wl/U8nOjn28ChvrI9bA
   0FaIz7E3NynhN6pCTAnkvXMoQSUph5DMCIairf7qFKMM+0PZNYpjfJseR
   WDoGca1x2TqPujnesMfNkM2PSE+tbEymHnCkI2i6XNiZeTLjkQ3dFzikL
   Q==;
X-CSE-ConnectionGUID: xhDwaecXQragLrajwcN9AQ==
X-CSE-MsgGUID: i9o4DwSmRLORG0RWnw+bDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217514"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217514"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:20 -0800
X-CSE-ConnectionGUID: UMkYhrQ+Sj+iPGSZp/6fPg==
X-CSE-MsgGUID: yQvncKosSn+WPJY3b3z6yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109799"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:21 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/12] tools/arch/x86/pmtctl: Add 'list --summary'
Date: Sun, 22 Nov 2026 11:34:01 -0800
Message-ID: <0f77cacbead1815624aa72ca6160012fd08010c6.1795374925.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795374925.git.david.e.box@linux.intel.com>
References: <cover.1795374925.git.david.e.box@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add the --summary mode to 'list', which shows the GUIDs of the PMT
telemetry devices on the system, each with its platform and description
when its definitions are available, and the devices that have it.
Unlike the metric listing it works without metric definitions, and like
it, it can be restricted with --guid and --device.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces 'list --devices' from v1 13; v1's 'list --guids' is
    dropped.
  - Works without metric definitions (v1's failed without built-in
    ones), is sorted, and honors --guid and --device.

 tools/arch/x86/pmtctl/src/cmd_list.c | 40 +++++++++++++++++++++++++++-
 tools/arch/x86/pmtctl/src/main.c     |  2 +-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/tools/arch/x86/pmtctl/src/cmd_list.c b/tools/arch/x86/pmtctl/s=
rc/cmd_list.c
index cefcb465969a..35a610909558 100644
--- a/tools/arch/x86/pmtctl/src/cmd_list.c
+++ b/tools/arch/x86/pmtctl/src/cmd_list.c
@@ -28,6 +28,9 @@
 #define LIST_GROUP_DESC_INDENT	4
 #define LIST_METRIC_DESC_INDENT	8
=20
+/* Indent of a device name under its GUID group header */
+#define LIST_DEVICE_INDENT	6
+
 /* Width limits of the line under a group header */
 #define LIST_SEP_MIN		((size_t)8)
 #define LIST_SEP_MAX		((size_t)100)
@@ -36,11 +39,13 @@
 enum {
 	OPT_LIST_GUID =3D CHAR_MAX + 1,
 	OPT_LIST_DEVICE,
+	OPT_LIST_SUMMARY,
 };
=20
 struct list_opts {
 	bool show_help;
 	struct pmt_device_filter filter;
+	bool summary;
 };
=20
 static void list_usage(FILE *out)
@@ -53,7 +58,8 @@ static void list_usage(FILE *out)
 		"Options:\n"
 		"  -h, --help              Show this help.\n"
 		"      --guid <hex>        Restrict to devices with this GUID.\n"
-		"      --device <name>     Restrict to one device, e.g. telem3.\n");
+		"      --device <name>     Restrict to one device, e.g. telem3.\n"
+		"      --summary           List GUIDs and their devices.\n");
 }
=20
 static int parse_list_opts(struct list_opts *opts, int argc, char **argv)
@@ -62,6 +68,7 @@ static int parse_list_opts(struct list_opts *opts, int ar=
gc, char **argv)
 		{ "help",	no_argument,	NULL, 'h' },
 		{ "guid",	required_argument, NULL, OPT_LIST_GUID },
 		{ "device",	required_argument, NULL, OPT_LIST_DEVICE },
+		{ "summary",	no_argument,	NULL, OPT_LIST_SUMMARY },
 		{}
 	};
 	int opt;
@@ -80,6 +87,9 @@ static int parse_list_opts(struct list_opts *opts, int ar=
gc, char **argv)
 		case OPT_LIST_DEVICE:
 			opts->filter.name =3D optarg;
 			break;
+		case OPT_LIST_SUMMARY:
+			opts->summary =3D true;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -176,6 +186,29 @@ static void print_guid_group_line(uint32_t guid, const=
 struct pmt_tss_info *info
 		print_description(info->description, LIST_GROUP_DESC_INDENT, cols);
 }
=20
+/* List @devs, which are sorted by GUID as ctx->devices is */
+static void do_list_summary(const struct pmtctl_ctx *ctx, const struct pmt=
_device **devs,
+			    size_t num_devs)
+{
+	size_t cols =3D output_columns();
+
+	printf("PMT devices on this system:\n\n");
+
+	for (size_t i =3D 0; i < num_devs; i++) {
+		uint32_t guid =3D devs[i]->guid;
+
+		if (!i || guid !=3D devs[i - 1]->guid)
+			print_guid_group_line(guid, pmt_tss_db_lookup(&ctx->tss, guid), cols);
+
+		print_chars(' ', LIST_DEVICE_INDENT);
+		printf("%s\n", devs[i]->name);
+
+		/* A blank line ends each GUID group */
+		if (i + 1 =3D=3D num_devs || devs[i + 1]->guid !=3D guid)
+			printf("\n");
+	}
+}
+
 /*
  * Underline a group header up to where its longest metric name would end =
at
  * the description indent, within LIST_SEP_MIN and LIST_SEP_MAX columns
@@ -274,6 +307,11 @@ int cmd_list(int argc, char **argv, const struct pmt_g=
lobal_opts *gopts)
 		return PMTCTL_EXIT_USER;
 	}
=20
+	if (opts.summary) {
+		do_list_summary(&ctx, devs, num_devs);
+		return PMTCTL_EXIT_OK;
+	}
+
 	if (!ctx.tss.num_tss_info) {
 		if (gopts->json_path)
 			log_err("no metric definitions in %s", gopts->json_path);
diff --git a/tools/arch/x86/pmtctl/src/main.c b/tools/arch/x86/pmtctl/src/m=
ain.c
index d4a7ae464cb8..081c33aeb649 100644
--- a/tools/arch/x86/pmtctl/src/main.c
+++ b/tools/arch/x86/pmtctl/src/main.c
@@ -27,7 +27,7 @@ static void print_usage(FILE *out)
 		"                          If omitted, " PMTCTL_DEFS_DIR " is used if it=
 exists.\n"
 		"\n"
 		"Commands:\n"
-		"  list      List available PMT metrics\n"
+		"  list      List available PMT devices and metrics\n"
 		"\n"
 		"Run 'pmtctl <command> --help' for command-specific options.\n");
 }
--=20
2.53.0

