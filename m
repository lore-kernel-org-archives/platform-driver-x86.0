Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376062;
	b=XJHS+Pz8AMoFB4iOBpDloUAoMyVVNNhTEL/A+eVcfcvHl0ZnA08JT9HMWfAOgP7UycTF
	 8Y9CZY6/hU1odK9wlDEZLQbYAyL8uRVMSCDUfWhq9JfWfs0v0GzcCyPuVl9Gjngv3eCmp
	 9wqaHaS3oljw5qIxjnAfklRS4IGTLTFVMK76H/NFXVj2cTiUTn08T4AVbOJm3Ly8WiZtQ
	 zA9ADUuBFGU8DBQTwg3pbVXwW01bZNZCnUKcqZsk9ik3D4NdSgFoXK31CAskH1HZcsFw9
	 mExvRcimKmpn3cj7tCKbQXRAJAzoySxJR/n2+46NhaRBnzH537gTWK3a85mslflRmtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376062;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nLzJDfWQU3Cb6v+75iwXdDzx/XV+Tet5c7iQdPS46xU=;
	b=svYYAQcc1VRc7diAS1MZfRprnHZcNZbpKoiI5VF4IMybCaAyB3Nql4WY77Njh183Dn6x
	 MNJyyvlTzhFjSpKJSAap6u0w4jLGfIlpRQOoxUUqPAVRRKWDcj+Nww3rLLuDDkmKlVZmH
	 VnfGquA3H2oVIySdnpRDfjtNV8RFR5wxmCeBLRbq7efMT7cxTeT1xgM26qoSipSu7YZEB
	 diJp95UY4cy018Tqrw3FIQ8MJC7Q7XmsJFOCwDQvAPwao7PDcDnNjAPcNzLkFLipeBGWU
	 ZY7XLVTdVS/0Qas17svqGBcni7EGFzodMUyKX9eUgP9rUYyKnGQti8nJLO0yTXor+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gCBM97Vd;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2836A606A33C;
	Sun, 22 Nov 2026 19:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2836A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gCBM97Vd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376062; x=1826912062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/xszF5m6efGlOIj86OJAhxDonBTqecf+Eeb0vqVW98M=;
  b=gCBM97VdLcmPNprcVJ6ZeRxKj79khvCo2I3Cbmp8bbZnmvkBC117g0F6
   h80mlc/bOrwVGvRfadKpYyG7T5kUf3qNz7s6iNKhY2dhM1LcYeLO0T+KB
   QIHUeIkeYAzTKULeAA0iKrMAet+YCBmDnQpUIq08tEaVDvQA06JjDAwrc
   JP+z7ZhBzjR95R7Ztc5Thpdp4cVtST5yox6EdMO7o4DsDw29/SiJgDMW+
   7DQgVrt9zfOn7vIcc+8V3ty+dlQsghoMmub114HOszIgnOQoBQJuFDMCY
   pC4IMNJxtz8u7iQsEGUuKJv9CIo9lEDOSUskVUAfk2GBjl3dFOqduUk6B
   w==;
X-CSE-ConnectionGUID: d0WGDuLTRQScIl+LeI6gNg==
X-CSE-MsgGUID: optZeD5cRvqa0pwBV01VPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217520"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:22 -0800
X-CSE-ConnectionGUID: hSw07ErRQymn0vXoljEOqA==
X-CSE-MsgGUID: pxO5LpnKRH268dMGeUFKMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109803"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:22 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/12] tools/arch/x86/pmtctl: Add 'stat --raw'
Date: Sun, 22 Nov 2026 11:34:04 -0800
Message-ID: <328af41f2dabd8ea2b3cb73e53b3569cb700a752.1795374925.git.david.e.box@linux.intel.com>
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

Add --raw to 'stat' to sample a bit range of a telemetry sample by its
position, id=3D<n>[,lsb=3D<n>][,msb=3D<n>], instead of by metric name. This
works without metric definitions, for example for a GUID that has none
or to check a definition against the data. --raw may be repeated and
combined with -e; as for metrics, more than one value needs --vertical.

A raw sample is read on each selected device whose telemetry region
contains it. A device whose region is too small is treated like one
without a requested metric: it is left out, or shows '-' with
--vertical. Requesting a sample that no selected device has is an error.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Split out of v1 14.
  - Follows the -e rules: may be repeated and combined with -e, and more
    than one value needs --vertical. v1 allowed several raw columns in
    the one-value layout.
  - A sample outside a device's region is treated like a metric the
    device doesn't have.
  - One strict parser for id, lsb and msb (v1 had three copies that
    accepted a sign); its errors name --raw.

 tools/arch/x86/pmtctl/src/cmd_stat.c | 145 +++++++++++++++++++++++++--
 1 file changed, 138 insertions(+), 7 deletions(-)

diff --git a/tools/arch/x86/pmtctl/src/cmd_stat.c b/tools/arch/x86/pmtctl/s=
rc/cmd_stat.c
index 8377c2d1d194..643686d067e6 100644
--- a/tools/arch/x86/pmtctl/src/cmd_stat.c
+++ b/tools/arch/x86/pmtctl/src/cmd_stat.c
@@ -44,6 +44,9 @@
=20
 #define STAT_COL_GAP		"  "
=20
+/* Room for the label of a --raw request: "raw[id=3D4294967295,lsb=3D63,ms=
b=3D63]" */
+#define STAT_RAW_LABEL_LEN	40
+
 /* Values for long-only options, above any short option character */
 enum {
 	OPT_STAT_GUID =3D CHAR_MAX + 1,
@@ -51,11 +54,19 @@ enum {
 	OPT_STAT_NO_HEADER,
 	OPT_STAT_VERTICAL,
 	OPT_STAT_HEX,
+	OPT_STAT_RAW,
 };
=20
 /* A value to sample on each device */
 struct stat_request {
 	const char *name;	/* metric name */
+
+	/* For --raw, which reads bits [lsb, msb] of sample sample_id instead */
+	bool raw;
+	uint32_t sample_id;
+	unsigned int lsb;
+	unsigned int msb;
+	char raw_label[STAT_RAW_LABEL_LEN];
 };
=20
 struct stat_opts {
@@ -118,12 +129,18 @@ static void stat_usage_full(FILE *out)
 {
 	fprintf(out,
 		"Usage: pmtctl stat [options] -e <metric>[,<metric>...] ...\n"
+		"       pmtctl stat [options] --raw id=3D<n>[,lsb=3D<n>][,msb=3D<n>] ...=
\n"
 		"\n"
 		"Collect metric values over time (similar to 'perf stat').\n"
 		"\n"
 		"Options:\n"
 		"  -h, --help              Show this help.\n"
 		"  -e, --event <spec>      Metric name or comma-separated list; may be r=
epeated.\n"
+		"      --raw <spec>        Read a raw sample value by sample id, with op=
tional\n"
+		"                          bit slicing; may be repeated and combined wit=
h -e.\n"
+		"                          <spec> is id=3D<n>[,lsb=3D<n>][,msb=3D<n>] wi=
thout\n"
+		"                          spaces, where 0 <=3D lsb <=3D msb <=3D 63 (de=
faults:\n"
+		"                          lsb=3D0, msb=3D63).\n"
 		"      --guid <hex>        Restrict to devices with this GUID.\n"
 		"      --device <name>     Restrict to one device, e.g. telem3.\n"
 		"  -i, --interval <ms>     Sampling interval (default 1000 ms).\n"
@@ -142,6 +159,9 @@ static void stat_usage_full(FILE *out)
 		"  pmtctl stat -e firmware_version -c 1\n"
 		"  pmtctl stat -e pch_temp --guid 03086000\n"
 		"  pmtctl stat --vertical -e package_energy,pch_temp\n"
+		"  pmtctl stat --raw id=3D2\n"
+		"  pmtctl stat --raw id=3D2,lsb=3D16,msb=3D31\n"
+		"  pmtctl stat --vertical --raw id=3D2,msb=3D7 --raw id=3D3,lsb=3D8,msb=
=3D15\n"
 	);
 }
=20
@@ -149,6 +169,7 @@ static void stat_usage_short(FILE *out)
 {
 	fprintf(out,
 		"Usage: pmtctl stat [options] -e <metric>[,<metric>...] ...\n"
+		"       pmtctl stat [options] --raw id=3D<n>[,lsb=3D<n>][,msb=3D<n>] ...=
\n"
 		"\n"
 		"Run 'pmtctl stat --help' for full help.\n"
 	);
@@ -196,6 +217,88 @@ static int parse_positive(const char *arg, const char =
*opt, uint32_t *val)
 	return 0;
 }
=20
+/* Parse the value of --raw key @key, which must be given once and be at m=
ost @max */
+static int parse_raw_value(const char *key, const char *val, uint32_t max,=
 bool *seen,
+			   uint32_t *out)
+{
+	if (*seen) {
+		log_err("duplicate key '%s' in --raw argument", key);
+		return -EINVAL;
+	}
+	*seen =3D true;
+
+	if (parse_u32(val, 10, out)) {
+		log_err("--raw %s must be a decimal integer, got '%s'", key, val);
+		return -EINVAL;
+	}
+
+	if (*out > max) {
+		log_err("--raw %s must be at most %" PRIu32, key, max);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* Add the request of a --raw argument, which is split in place at the com=
mas */
+static int add_raw_request(struct stat_opts *opts, char *arg)
+{
+	struct stat_request req =3D { .raw =3D true };
+	uint32_t msb =3D PMT_SAMPLE_BITS - 1;
+	uint32_t lsb =3D 0;
+	bool seen_id =3D false;
+	bool seen_lsb =3D false;
+	bool seen_msb =3D false;
+	char *tok;
+	int ret;
+
+	while ((tok =3D strsep(&arg, ","))) {
+		char *val =3D strchr(tok, '=3D');
+
+		if (!val) {
+			log_err("invalid --raw token '%s' (expected key=3Dvalue)", tok);
+			return -EINVAL;
+		}
+		*val++ =3D '\0';
+
+		if (!strcmp(tok, "id")) {
+			ret =3D parse_raw_value(tok, val, UINT32_MAX, &seen_id, &req.sample_id);
+		} else if (!strcmp(tok, "lsb")) {
+			ret =3D parse_raw_value(tok, val, PMT_SAMPLE_BITS - 1, &seen_lsb, &lsb);
+		} else if (!strcmp(tok, "msb")) {
+			ret =3D parse_raw_value(tok, val, PMT_SAMPLE_BITS - 1, &seen_msb, &msb);
+		} else {
+			log_err("unknown key '%s' in --raw argument", tok);
+			ret =3D -EINVAL;
+		}
+
+		if (ret)
+			return ret;
+	}
+
+	if (!seen_id) {
+		log_err("--raw requires at least 'id=3D<num>'");
+		return -EINVAL;
+	}
+
+	if (lsb > msb) {
+		log_err("--raw lsb (%" PRIu32 ") cannot be greater than msb (%" PRIu32 "=
)",
+			lsb, msb);
+		return -EINVAL;
+	}
+
+	req.lsb =3D lsb;
+	req.msb =3D msb;
+	snprintf(req.raw_label, sizeof(req.raw_label), "raw[id=3D%" PRIu32 ",lsb=
=3D%u,msb=3D%u]",
+		 req.sample_id, req.lsb, req.msb);
+
+	ret =3D add_request(opts, &req);
+	if (ret)
+		return log_ret(ret, "unable to add --raw request");
+
+	return 0;
+}
+
 static int stat_parse_options(struct stat_opts *opts, int argc, char **arg=
v)
 {
 	static const struct option long_opts[] =3D {
@@ -208,6 +311,7 @@ static int stat_parse_options(struct stat_opts *opts, i=
nt argc, char **argv)
 		{ "no-header",	no_argument,		NULL, OPT_STAT_NO_HEADER },
 		{ "vertical",	no_argument,		NULL, OPT_STAT_VERTICAL },
 		{ "hex",	no_argument,		NULL, OPT_STAT_HEX },
+		{ "raw",	required_argument,	NULL, OPT_STAT_RAW },
 		{}
 	};
 	int opt;
@@ -251,6 +355,11 @@ static int stat_parse_options(struct stat_opts *opts, =
int argc, char **argv)
 		case OPT_STAT_HEX:
 			opts->hex =3D true;
 			break;
+		case OPT_STAT_RAW:
+			ret =3D add_raw_request(opts, optarg);
+			if (ret)
+				return ret;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -262,7 +371,7 @@ static int stat_parse_options(struct stat_opts *opts, i=
nt argc, char **argv)
 	}
=20
 	if (!opts->num_requests) {
-		log_err("requires -e/--event");
+		log_err("requires -e/--event or --raw");
 		return -EINVAL;
 	}
=20
@@ -274,6 +383,14 @@ static int stat_parse_options(struct stat_opts *opts, =
int argc, char **argv)
 	return 0;
 }
=20
+static const char *request_label(const struct stat_request *req)
+{
+	if (req->raw)
+		return req->raw_label;
+
+	return req->name;
+}
+
 static int metric_name_cmp(const void *key, const void *elem)
 {
 	const struct pmt_metric_def *def =3D elem;
@@ -296,6 +413,18 @@ static void resolve_request(const struct pmtctl_ctx *c=
tx, const struct pmt_devic
=20
 	*cell =3D (struct stat_cell){};
=20
+	/* A raw request names its location, which a device has if it's in its re=
gion */
+	if (req->raw) {
+		if (!sample_in_region(dev, req->sample_id))
+			return;
+
+		cell->present =3D true;
+		cell->sample_id =3D req->sample_id;
+		cell->lsb =3D req->lsb;
+		cell->msb =3D req->msb;
+		return;
+	}
+
 	info =3D pmt_tss_db_lookup(&ctx->tss, dev->guid);
 	if (!info || !info->num_metrics)
 		return;
@@ -354,7 +483,7 @@ static int build_rows(struct stat_run *run, const struc=
t pmt_device **devs, size
 	for (size_t r =3D 0; r < num_requests; r++) {
 		if (!found[r]) {
 			log_err("no selected device has metric '%s'",
-				run->opts.requests[r].name);
+				request_label(&run->opts.requests[r]));
 			return -ENOENT;
 		}
 	}
@@ -381,7 +510,7 @@ static int check_bounds(const struct stat_run *run)
 			if (!sample_in_region(row->dev, cell->sample_id)) {
 				log_err("%s: sample %" PRIu32 " of '%s' is beyond the %" PRIu32
 					"-byte telemetry region", row->dev->name, cell->sample_id,
-					run->opts.requests[r].name, row->dev->size);
+					request_label(&run->opts.requests[r]), row->dev->size);
 				return -ERANGE;
 			}
 		}
@@ -448,7 +577,7 @@ static const char *format_value(const struct stat_cell =
*cell, bool hex, char *bu
 static size_t value_width(const struct stat_run *run)
 {
 	size_t width =3D STAT_VALUE_LEN;
-	size_t len =3D strlen(run->opts.requests[0].name);
+	size_t len =3D strlen(request_label(&run->opts.requests[0]));
=20
 	if (!run->opts.vertical && len > width)
 		width =3D len;
@@ -488,7 +617,7 @@ static void print_header(const struct stat_run *run)
 		print_column(STAT_COL_METRIC, run->label_width, false);
 		fputs(STAT_COL_GAP STAT_COL_VALUE "\n", stdout);
 	} else {
-		print_column(run->opts.requests[0].name, value_width(run), true);
+		print_column(request_label(&run->opts.requests[0]), value_width(run), tr=
ue);
 		putchar('\n');
 	}
=20
@@ -522,7 +651,8 @@ static void print_sample(const struct stat_run *run, ui=
nt64_t sample, uint64_t t
=20
 			print_line_start(run, sample_buf, time_buf, row->dev->name);
 			if (run->opts.vertical) {
-				print_column(run->opts.requests[r].name, run->label_width, false);
+				print_column(request_label(&run->opts.requests[r]),
+					     run->label_width, false);
 				fputs(STAT_COL_GAP, stdout);
 				fputs(value, stdout);
 			} else {
@@ -543,7 +673,8 @@ static void set_column_widths(struct stat_run *run)
=20
 	run->label_width =3D strlen(STAT_COL_METRIC);
 	for (size_t r =3D 0; r < run->opts.num_requests; r++)
-		run->label_width =3D max(run->label_width, strlen(run->opts.requests[r].=
name));
+		run->label_width =3D max(run->label_width,
+				       strlen(request_label(&run->opts.requests[r])));
 }
=20
 /* Read every present cell; return the last read error, or 0 */
--=20
2.53.0

