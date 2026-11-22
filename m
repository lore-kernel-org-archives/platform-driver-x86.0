Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376063;
	b=w1uWnK3BFqtKB3ctpp/G6ebqYRhRXeQQk/sP8VArv8gIyXLPAnQgC0m05z3osezKJH+n
	 jBeuaC3L0s98e/+bmWDdlf4O4oi+GVpN0Xzi46MEHoh1yysrViICVPPAQHbDqcXBVa6oL
	 OjOQLxl1gTWz1ddFpjicGziK7xMqnJhaJo63tNVk8UPJm0hcbu6+sXgPLd2isCIPKmw86
	 QUs0xWOBTPZs4Nzi5A7VViIKdd2SAkmitKYYTSLhpP3OxhL4mn/RRJKbt8e1fdsbEY5ZE
	 Esej7MfCekFOUyOauQNjbR2kgV4JYeo1Z6gRx6kbbX2KlDZ3hMF90TFVFqANcsCymhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376063;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yt76KQlD640Muqv2+yYVkgsdhiZxjiGfT2O2endhm3o=;
	b=zktMl0g/Q+xCBCys06AaotKGyBvduJ65mtD8yy1tNmf2btU/tyA0TPXUix+1KHSFBk7n
	 FlWUvWZYNpS7CsKeStwzlZqvhn0lHTKh8vhkKYgZ31KWySkTL64XB75sYAzykvzaBFmgy
	 yEbf0NCALSGR8Ssoqw347K/oitBwlLumz1FDNLcIOuT7jb+NPl+LHB9Ozn4dV3SfA9Jnc
	 oF+WgjfJf+OO+MeuhRh4Py75bypTyyJEBAm90cFkYcG23snv0jmKdwn1e9R0C9YekBifl
	 w/Wib0u7XLIGDhfqBGWne5r9gSi0Fzt3D5mJgT2DVhFhkYj0JwiQtXRfQhBt261FXHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dy7Ma3YK;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B1606A69E;
	Sun, 22 Nov 2026 19:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37B1606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Dy7Ma3YK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795376062; x=1826912062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NF4LDqLI5TNwz2MEuGNyEjN81+EUAaFBq/cTEkWdjww=;
  b=Dy7Ma3YKln9a4dkDg/TkKeVO4ktFNqnj9cRTGEOeagveZTLn+PuopI+g
   ta9XM/DnZAbvwj/ZuvA5mtPpL1gunJfRaCNyuqQkUPSTCIN3skThlzw2W
   z8gZKHQnugFoAudoxtOMJ8baIWh5m9yiXISzMp4mEgkqB+VTyXPUnI6/6
   37p68Y2fjuyebDnwF3SeU+mI6NBXROL7+udu9jevnlLPk6iarENF9GXxM
   obxLfUCd0vgHhCWTZIiA9nFU1UMov6H+7j0tYgHidEgKi05pNN6PGx5rH
   Yv0bmArOl0haenRm9StCJUlvDXyulRhGfAZ8kXC5WkaMqbEuGasao0AUo
   w==;
X-CSE-ConnectionGUID: wXCEp4x+T6WNpl0zPZWTYg==
X-CSE-MsgGUID: s1SEJ5yhTqqQRBZsNWfsgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4217522"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4217522"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:22 -0800
X-CSE-ConnectionGUID: 3Sk0wfhsRsuwnI2f4MG9Ug==
X-CSE-MsgGUID: nchoBspaSF2QnW1lxGtG1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11109805"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.54.77.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 11:34:23 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/12] tools/arch/x86/pmtctl: Add README
Date: Sun, 22 Nov 2026 11:34:05 -0800
Message-ID: <00e4e34485ad03a608a20b199264111c1cc5116f.1795374925.git.david.e.box@linux.intel.com>
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

Add a README that describes how to build and install pmtctl, how to
get the metric definitions from the Intel-PMT repository, and how to
use the 'list' and 'stat' commands, including the privileges they need
and the exit status.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2 changes:
  - Replaces v1 16 (README.md), rewritten for v2 as plain text like the
    other READMEs in tools/.

 tools/arch/x86/pmtctl/README | 96 ++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 tools/arch/x86/pmtctl/README

diff --git a/tools/arch/x86/pmtctl/README b/tools/arch/x86/pmtctl/README
new file mode 100644
index 000000000000..7d9a57cf3925
--- /dev/null
+++ b/tools/arch/x86/pmtctl/README
@@ -0,0 +1,96 @@
+pmtctl
+=3D=3D=3D=3D=3D=3D
+
+pmtctl lists and samples the telemetry of Intel Platform Monitoring
+Technology (PMT) devices. The pmt_telemetry driver registers a telemetry
+device, telemN, for each telemetry region of a platform. Its data is an
+array of 64-bit samples, and its GUID identifies the layout: which bits
+of which sample hold which metric. pmtctl uses metric definitions
+generated from the layouts Intel publishes to name and decode the data.
+
+
+Building
+--------
+
+    make
+
+This needs libjansson and its development files (libjansson-dev on
+Debian and Ubuntu, jansson-devel on Fedora and RHEL).
+
+    make install
+
+installs pmtctl to /usr/sbin, and the metric definitions, if they were
+fetched, to /usr/share/pmtctl. BINDIR and DEFSDIR change the locations,
+and DESTDIR is prefixed to both.
+
+
+Metric definitions
+------------------
+
+The layouts are published as XML in the Intel-PMT repository
+(https://github.com/intel/Intel-PMT). scripts/pmtxml2json.py converts
+them into one JSON file per GUID:
+
+    make defs-json-fetch    # clone Intel-PMT once and convert it into def=
s/
+    make defs-json-pull     # update the clone and convert again
+    make defs-clean         # remove defs/
+
+These targets need Python 3 with lxml, and are not part of the default
+build, so a plain 'make' never accesses the network. The clone is kept in
+~/.cache/pmtctl (PMT_CACHE_DIR). The JSON format and how event names are
+derived from the XML are described in scripts/pmtxml2json.md.
+
+pmtctl reads the definitions from the installed directory, or from the
+file or directory given with -J:
+
+    pmtctl -J defs list
+
+
+Usage
+-----
+
+    pmtctl [global options] <command> [command options]
+
+'list' shows the metrics of the telemetry devices on the system, grouped
+by GUID. 'list --summary' shows the GUIDs and their devices instead:
+
+    pmtctl list
+    pmtctl list --summary
+
+'stat' samples metrics at an interval, once a second by default. -i sets
+the interval in milliseconds and -c the number of samples:
+
+    pmtctl stat -e package_energy
+    pmtctl stat -e package_energy -i 500 -c 10
+
+The default layout has one row per device. More than one value needs
+--vertical, which prints one line per device and value:
+
+    pmtctl stat --vertical -e package_energy,pch_temp
+
+--raw samples a bit range of a sample by its position, without metric
+definitions. --hex prints values in hex:
+
+    pmtctl stat --raw id=3D2,lsb=3D16,msb=3D31
+    pmtctl stat --raw id=3D0,msb=3D31 --hex
+
+--guid and --device restrict both commands to the devices with a GUID
+or to one device:
+
+    pmtctl list --guid 03086000
+    pmtctl stat -e pch_temp --device telem3
+
+The telemetry data files can only be read by root, so 'stat' must run
+as root; 'list' doesn't need to.
+
+'pmtctl --help' and 'pmtctl <command> --help' describe all options.
+
+
+Exit status
+-----------
+
+  0  success
+  1  the request is wrong: an invalid option or value, or nothing
+     matches the selection
+  2  something failed while carrying it out, such as reading the devices
+     or the metric definitions
--=20
2.53.0

