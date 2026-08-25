Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE613F1ABE
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652785; cv=none; b=L9ihWCar8F9117RGWpMok/1WdXhRy0ntdG/d7XA/xCHqVQL2tEBNJVJd6kP91vFLwB0Ss1Kkz0R0EOPtcAF+eVFeHgg9yBUCY5CazJLeFUVSbpeaF//0AFwb9eA1sgsl2JTYLzUd+eq45LGHD2ICr4QBJk0ZPfgHLoNRvTmzyrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652785; c=relaxed/simple;
	bh=RAGFgUE/hL9ns4Dc9Yzxf5XGA2OGySAH7T6FTytqKYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3TqmtRPF+UddBzYGz14DmJvUSNryyiRoWrQJDIfiOCHjDsA5F6hQHQFno8a9ihz4qlzNvVPJJcrZ0jlWWp0itdfgNPaMe6dtMExXv6aYvZhhRUExfhYuV3I2BLeDQitZRihA9mjIL4T6NdT4sV2/K4Ho2hbwMjgzDChYU0Kq/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfoYJ12h; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfoYJ12h"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so5693815a91.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787652783; x=1788257583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=okcv3TiKdUkjHH/2Q47/3TclBNSBZ0LXy94OPqvg5Lg=;
        b=LfoYJ12h9Lbj4GtcLPEKRC37EUTWUFOGtsvoJXaOXKSc95SDraOnVnhqW2x66ZMf/0
         iQ0GZnI1PctpJ3tofW53ifNircHQw5nvoi9AXucg+5BjTntOawpOwtKR+93GdWnW5JiX
         GW9Uv+stfB/+VINoUtLxI3pvU1Iqq/SmVWmgVza5BbO/YLmcIMNXD/BMr+aIWSu7a9qD
         Mr6Kzgx+d3eAbI6vCeO6ja2vjuwJNNm/Z9RhseFZZcM0Zb5W0T7xQTuUEktiwySDBkYW
         vNvKUXaVcMnY/uxpVlMLKM+1tSKFsSTen7Vce6R1g0kFf9U77DwBoZrQRLo2vVCvcnEd
         ZfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652783; x=1788257583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=okcv3TiKdUkjHH/2Q47/3TclBNSBZ0LXy94OPqvg5Lg=;
        b=qKBN2wwVCFu5Dhw5c2av8x56o5Qp1aCyH40TzHPMTZ6H2wZEzAYRSAd//sMdKM+UBM
         htcqSSChFwHS8QZ63sDJRMi+j0jJ0VR7Sqnwzagwb4otwVDQW07e2XnlXuvGiaYkhTSJ
         uXEPX4JRs4h+84Oj+dJaj86ZvIVcmNjajjtm7xV/dBewxbEL9oerU65c4HIXXttFES7m
         W0bUjotbrkdQgBMO6SuffbDhtdd0pCoYvZWN8iXqYJ6mrZy2m6Xw5k1azvu+XmWJhEnF
         Sr1A8fgVh453S/N+jjti1CHOjyM9u/PGOtL224xJUMNwXDZrxydF9ZuANufcRIR/Y8Cf
         iLAQ==
X-Gm-Message-State: AFuF++nSBQY34bXznfthdv82OEv3PEjL7KEGQivpN8N1PB5AoWvm80Iq
	9xf3EOZhhjkckOdQ7/RjskiP0zPvXe4n6eS9nb6Bhpze2N7ymYCV2Bv+
X-Gm-Gg: AR+sD1343DAbaDnq5cPxo1RA/yTW+NWMBjOC5gAjiOrtgrM6fRhep77NTBXRm3kzTlO
	ro6IEj01uF6MiVU5gdQIm2xHMx1Vk/0VA04AQTFT+coU20DRFHCmoI0pxH/fY0gBL9ZBtaAaMKX
	TdWwbcFtYrGKgKMoAXx0fcafm/Xb0eGZiFYlV2FhVlgwLBN4MFvk1UZC4MMVLzC4JQjR0i65AwQ
	ChsS8tEdCAp7dT39dVvyRqt1zpcoLaDEcXcQyCG1cc6qCDoE/cf1J63EKlwg1V2mbnW6YUVSyQq
	2xFTZ40lf1NSoheZCvQJdCCnzIIvdpN3nblwHbmfbUKuqJGcOpuoXmcl+XtFWsQ/JjVq3Ig2PnH
	OIs0nIyJql4loFhK7etBKpMqArYv3xTXoQSe3H2+YMDLoSox1UdkWPyLoysQLlvvCy11Y8U4xFu
	a4ACEXA/Fsv2UImBbhAX/FRRAZ5EueH4FicdA//nFYWbjtW4d+oyjG5bWjZb2FGEntyzbi3iO9Y
	3w69LNjwL+Q3c5VHSTdDZ9AuuJSVUqQX/7r7Z+zOw==
X-Received: by 2002:a17:90b:5112:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-395df3cf1c8mr48525381a91.10.1787652782947;
        Tue, 25 Aug 2026 03:13:02 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9209f51sm57715424eec.22.2026.08.25.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:13:01 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: fix heap OOB read and memory corruption in hp_wmi_perform_query()
Date: Tue, 25 Aug 2026 15:12:10 +0500
Message-ID: <20260825101210.47782-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_perform_query() evaluates an ACPI WMI method and expects a
struct bios_return header in the returned buffer. However, it only
checks that the ACPI object type is ACPI_TYPE_BUFFER without verifying
that obj->buffer.length is at least sizeof(*bios_return) (8 bytes).

If the firmware or ACPI method returns a buffer shorter than 8 bytes:
1. bios_return->return_code at offset 4 reads out of bounds from the
   allocated ACPI buffer slab.
2. If return_code evaluates to 0 and outsize is non-zero,
   (int)(obj->buffer.length - sizeof(*bios_return)) evaluates to a
   negative integer (e.g. -8 for a 0-length buffer).
   actual_outsize is set to this negative value and passed to
   memcpy(buffer, ..., actual_outsize), where the signed negative value
   is cast to size_t (e.g. 0xfffffffffffffff8), attempting to copy ~18
   Exabytes and triggering an immediate kernel crash.
   Additionally, memset(buffer + actual_outsize, ...) performs an
   out-of-bounds write before buffer.

Fix this by ensuring obj->buffer.length is at least sizeof(*bios_return)
before accessing the return code, and compute actual_outsize safely
using min_t(u32, ...).

Fixes: c3021ea1beee ("hp-wmi: allow setting input and output buffer sizes separately")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..f3cab841afc4 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -616,8 +616,9 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		goto out_free;
 	}
 
-	if (obj->type != ACPI_TYPE_BUFFER) {
-		pr_warn("query 0x%x returned an invalid object 0x%x\n", query, ret);
+	if (obj->type != ACPI_TYPE_BUFFER ||
+	    obj->buffer.length < sizeof(*bios_return)) {
+		pr_warn("query 0x%x returned wrong type or too small buffer\n", query);
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -636,7 +637,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	if (!outsize)
 		goto out_free;
 
-	actual_outsize = min(outsize, (int)(obj->buffer.length - sizeof(*bios_return)));
+	actual_outsize = min_t(u32, outsize, obj->buffer.length - sizeof(*bios_return));
 	memcpy(buffer, obj->buffer.pointer + sizeof(*bios_return), actual_outsize);
 	memset(buffer + actual_outsize, 0, outsize - actual_outsize);
 
-- 
2.55.0

