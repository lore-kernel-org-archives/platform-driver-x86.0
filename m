Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376062;
	b=J8lEPqrWYcWVfr1f+BXrKK3p4xqWvH6D+Sj/Z/f/oiefXKbAyf7ObfCPD2fyJjg7L6MO
	 V6aVi3nHVsBeRGcH76SF/3+BXnKhB2W8aYt/2zkoIPyQylGWyzpXYGrM4BoEc1GK+h2F6
	 QoPP48E58aZOkDF1XrMOEd+9shOfeJVAFPo/mnWF5avNje8LCkofUHIaa2JjU/z0sTnoU
	 5dCoOKGdYDds1+OG1fIh1kF93lHDL9yx0/FbGt3la6RB2tfY7DWWwfGdeyjGvn9THZyX0
	 ekJbn9IS8dwa/qvXBDx0bOnQZebC4lbxIm71NnMPQ4AFaFqQEZa2G055ZA2X9xrd1qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376062;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WoDH317/3NZg/rD7xE2uFaRlVP3aJ7CI4ZPBY6MpUnQ=;
	b=2ZaG+y1z+U82yWBClFHA/xZJRbgdkT1wC27/6iMu5YBFET2cL60K8w63EshBbsgEQuch
	 G+bu/OqhLAViYC7O7ipbnMF0mFb53z9TlimTDRr3HrH39LZcD39bXVPoi3QpScNa7uPbh
	 wTv8G3HsSWjaKIf5EGNFlkR/7hCvoWPUe4xb04wp6uwTtJ1lrHx6B4yKXnfkPo+AVw3h4
	 dhzuqgG25l0bpkcKnEnrWEclD5a3CGo5ggJz7ErOLuqaNAwXuB6hEZQ/JBLCYF2Hwv2YD
	 ZZeTRjYqq3o2EURlxe6pZ/OvSsn7teLXEAP77t8wigFDNutm/lEbhSaIJT9Km6hhZpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ixH2QoM5;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8004606A33A;
	Sun, 22 Nov 2026 19:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8004606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ixH2QoM5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376061; x=1826912061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HYP3/JOoTFkWBhqjnJf/9iX6pqTHjzdTPjENXjlsX/c=;
  b=ixH2QoM5JDIcPLTmHBv8WJMelka2/ZsJH3FavAkiMifBvmGl9knsjOCP
   OHXZMluG35+CBv8bp8AnuVr4q0VpgKn/BCkWAf3AoegIwv9vbhT7E/I0M
   LCYhKxJdOAXpo8A02bkOiJ6TGaYmwCiBMYJtV/XYWXMHStcj4nL070p3W
   XOh80nzWwBGn4/9MwrIOyJtFOyuSFlj3mULrOtcnt+OU3pkhCfgRRuT01
   F8SYiROzJf8XgRU8hNRiZ8TBeU/RY/2+E+rjPNU9bB/5sfbd8b2GXMGsR
   vhW/CB1ww/50/cu15+zJquo+AvyhzExXJKqL+5xj0fLFEHAezbTo2hEEc
   w==;
X-CSE-ConnectionGUID: Zva6g11eT3aHBwfw3Bbxvg==
X-CSE-MsgGUID: l/MULkA1RCC72sbtN8pv5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217518"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217518"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:21 -0800
X-CSE-ConnectionGUID: PftWmrIQRTmiQHEq1h8wOw==
X-CSE-MsgGUID: Ko7i/e23R1CfvVHPOXQ2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109802"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:22 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/12] tools/arch/x86/pmtctl: Add 'stat --hex'
Date: Sun, 22 Nov 2026 11:34:03 -0800
Message-ID: <fa7f0b5492820de13d0816a1dbed23b2e7c7738f.1795374925.git.david.e.box@linux.intel.com>
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

Add --hex to 'stat' to print the sampled values in hexadecimal, which
is easier to read for fields that hold flags, IDs or packed data.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Split out of v1 14; no change in behavior.

 tools/arch/x86/pmtctl/src/cmd_stat.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/arch/x86/pmtctl/src/cmd_stat.c b/tools/arch/x86/pmtctl/s=
rc/cmd_stat.c
index 11a2ab1fa341..8377c2d1d194 100644
--- a/tools/arch/x86/pmtctl/src/cmd_stat.c
+++ b/tools/arch/x86/pmtctl/src/cmd_stat.c
@@ -50,6 +50,7 @@ enum {
 	OPT_STAT_DEVICE,
 	OPT_STAT_NO_HEADER,
 	OPT_STAT_VERTICAL,
+	OPT_STAT_HEX,
 };
=20
 /* A value to sample on each device */
@@ -67,6 +68,7 @@ struct stat_opts {
 	uint32_t count;		/* number of samples, 0 until interrupted */
 	bool no_header;
 	bool vertical;
+	bool hex;
 };
=20
 /* The value of one request on one device */
@@ -127,6 +129,7 @@ static void stat_usage_full(FILE *out)
 		"  -i, --interval <ms>     Sampling interval (default 1000 ms).\n"
 		"  -c, --count <N>         Number of samples (default infinite).\n"
 		"      --no-header         Don't print the header.\n"
+		"      --hex               Output values in hex.\n"
 		"      --vertical          One line per value per sample: sample time_ms=
 device\n"
 		"                          metric value. Required for more than one valu=
e.\n"
 		"\n"
@@ -204,6 +207,7 @@ static int stat_parse_options(struct stat_opts *opts, i=
nt argc, char **argv)
 		{ "count",	required_argument,	NULL, 'c' },
 		{ "no-header",	no_argument,		NULL, OPT_STAT_NO_HEADER },
 		{ "vertical",	no_argument,		NULL, OPT_STAT_VERTICAL },
+		{ "hex",	no_argument,		NULL, OPT_STAT_HEX },
 		{}
 	};
 	int opt;
@@ -244,6 +248,9 @@ static int stat_parse_options(struct stat_opts *opts, i=
nt argc, char **argv)
 		case OPT_STAT_VERTICAL:
 			opts->vertical =3D true;
 			break;
+		case OPT_STAT_HEX:
+			opts->hex =3D true;
+			break;
 		default:
 			return -EINVAL;
 		}
@@ -419,7 +426,7 @@ static void print_column(const char *s, size_t width, b=
ool right)
 		print_chars(' ', pad);
 }
=20
-static const char *format_value(const struct stat_cell *cell, char *buf, s=
ize_t len)
+static const char *format_value(const struct stat_cell *cell, bool hex, ch=
ar *buf, size_t len)
 {
 	if (!cell->present)
 		return STAT_VAL_ABSENT;
@@ -427,6 +434,11 @@ static const char *format_value(const struct stat_cell=
 *cell, char *buf, size_t
 	if (!cell->valid)
 		return STAT_VAL_FAILED;
=20
+	if (hex) {
+		snprintf(buf, len, "0x%" PRIx64, cell->value);
+		return buf;
+	}
+
 	snprintf(buf, len, "%" PRIu64, cell->value);
=20
 	return buf;
@@ -505,7 +517,8 @@ static void print_sample(const struct stat_run *run, ui=
nt64_t sample, uint64_t t
 		for (size_t r =3D 0; r < run->opts.num_requests; r++) {
 			const char *value;
=20
-			value =3D format_value(&row->cells[r], value_buf, sizeof(value_buf));
+			value =3D format_value(&row->cells[r], run->opts.hex, value_buf,
+					     sizeof(value_buf));
=20
 			print_line_start(run, sample_buf, time_buf, row->dev->name);
 			if (run->opts.vertical) {
--=20
2.53.0

