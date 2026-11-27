Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.32.116.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769362;
	b=M03lqbdGQsi2is8sgv7BaT7y/2wRAPhXkfm+fj5NBxVZAeu+jlGjlvrNPZXKqMB8J5zr
	 qvdhHcTrEAZzG2egd8MbyTG2xFGx9tE3xf/g65ZKL+erH/LLgV9ycBq1feTjanwo6CML6
	 h40oRE5mwy9ZEQW01TMf1q4OFL28YANGjLlJTZT4kL/Y3+OHBmfDcPjnn1V7BgIUvZG6j
	 IyXlU/hGrHersWpQ5oVTshBjdR9bFdiNAtN5B+vLY98gxMczyfl9l/BCjQuvJz0bIA2W4
	 LrzEwsL/91tD9CPyseK4kpksT85boGaJQShbZp6sq7iMVkUkUAphA75vtIyMjmnHHGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769362;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
	b=m+wHU3x4BHxPyDAewcI6TdDLg83XA0XWWwS0OCBf3hdgftDczY9KB0Qitclsz/mNW+yL
	 cRNgRPNrbbND4KE5D2dvnWjchAiQ3ecKPo/A7ac1FoxvbYy4mLIJhYCwUcbPJ9GW4hbxI
	 URuoLhiOIz//E2ejaBm/LefWeVWM/WFMgzq1E/44A10FyRGh+0mCA2cuc48j1wJ8pHF7m
	 ZmeNL86DIvtWYg4f87fuzB+X5Pd84O3flHMOgNsNcCmkT1Sww0Lkng3w/4XEd5jVUqwOm
	 x5Dm8bv/v0kLT1TdrUxlIVKRGhYp+T/scUtmvqbWHmXZHNfcYA9Lj9J91onW1SPV/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=nOL6PJ2E;
	arc=none smtp.remote-ip=178.32.116.78
Received: from 8.mo583.mail-out.ovh.net (8.mo583.mail-out.ovh.net [178.32.116.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FF606A6B6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 08:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4FF606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=nOL6PJ2E
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.254.83])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4jbRt14TGgz5wyY
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 08:49:13 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-bntqx (unknown [10.110.113.124])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 30626C2A93;
	Fri, 27 Nov 2026 08:49:13 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-bntqx with ESMTPSA
	id 3zMOCghECWtv1hQAXudyjw:T2
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 08:49:13 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00410321a2c-1847-43d7-b49b-6d90779d9ecd,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v4 1/3] platform/x86: dasharo-acpi: Extract dasharo_call() from dasharo_read_channel()
Date: Fri, 27 Nov 2026 09:49:08 +0100
Message-ID: <20261127084910.3355833-2-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127084910.3355833-1-filip.golas@3mdeb.com>
References: <20261127084910.3355833-1-filip.golas@3mdeb.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 4902449669630128111
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGmTo2SJLw22JHTIqldyJfHVhl4m6anTstpuqlZPPd16K+Tn0/hy/vNxAz0zWtSwAiC17uO1AVxzXNJJSVsGCbQTSajakJkTp/DEQkNG9r2WjLD5Z3btMqPcIeIX1fKFgdY1lFT5SIMPHl+lPJbd77O/Kgfm39lQRLbUmJNW9EwQL3wudFcBgi1xIWV0FzY0ws+I8mejZoac/VXb0AV4ArJH7gyBp2biRp0EqjiLtd1gyTb1WOxMmYdPke6kdgHwGERZvoG4u4YqKeb63bTlueqMyKpyE4mWvtsmRphwEVzmCEvJFvUQPdEm0bOXofatBDJP7tkbjDo4L3wYChzhtjBKb1NI06qwqGQiuZxUw673/gWWRpjzh8SRYqyIuaQd4Y/g/u97qS4FoeTqqyEQws1PbsUv10How1lX7ZJm2IDeYyphWhKroNsV+aOqh2ZOV0u/2WidfCXdzxsZGE7vomdMOJmLCFfMVv9RBEIChCILUkGmeEPAukk4RU8VJKo6SvIQLe/X0duwS/iMPYHQAwh64Yp26hg/CDMHXJOjPKP2jEgqc3TPFPdlhCZS997VD7FVZD7BihHKoxz2JdmmFel9SKKkn3j40O8uXzSv60oMVuwwg5iG8UxNyqR6qhJHBCpgaPa0QYEPOz6egdg2wqx3szh0y8M8JTptfQF30BzDg
DKIM-Signature: a=rsa-sha256; bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795769353; v=1;
 b=nOL6PJ2E1KHgevwfog/0+d/jp2u3HSeS68lSQCVU/kdciMZYBaJmCw7zRwQRJN/4Uf/YD+G1
 V+MZ/z4242Oy+SGWR5OC/fybdRQlJpt+AeRkK0ANSzxgCFJUWaUlk8KspUbBnnoY1i1Zg3O+R3b
 cG8HBkLEpqsbNVkfrVD14DbzA1uV/gpuvCu1CPSmikvlpoPOZy1E0A7oDn8fkOsqmwt7peh3qsC
 6jfk89+2VE5WuEs3JA3+ADtMosBKkVZQ+FD2X4HGmh4gpsUvO05k9Fj4geXj+/ZGrB3FfRWh1Xs
 TGWHFFKbOrbz7XWhP5pwdqlviX32sOIAdr6MJ/Xrqd7dw==

Move the ACPI method evaluation out of dasharo_read_channel() into a new
dasharo_call() helper, which additionally accepts up to two extra integer
arguments after the channel's group and index. This allows the upcoming
write and fan curve support to reuse the same code path.

No functional change intended.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
 drivers/platform/x86/dasharo-acpi.c | 40 +++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index dfea00cdde18..13d97eb43511 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -93,13 +93,18 @@ static int dasharo_get_feature_cap_count(struct dasharo_data *data, enum dasharo
 	return count;
 }
 
-static int dasharo_read_channel(struct dasharo_data *data, char *method, enum dasharo_feature feat, int channel, long *value)
+/*
+ * Evaluate a DASH method taking the group and index of a channel, followed by
+ * up to two more integer arguments, and returning an integer.
+ */
+static int dasharo_call(struct dasharo_data *data, const char *method, enum dasharo_feature feat,
+			int channel, const u64 *args, unsigned int n_args, u64 *ret)
 {
 	struct acpi_object_list obj_list;
-	union acpi_object obj[2];
+	union acpi_object obj[4];
 	acpi_handle handle;
 	acpi_status status;
-	u64 val;
+	unsigned int i;
 
 	if (feat >= ARRAY_SIZE(data->capabilities))
 		return -EINVAL;
@@ -107,20 +112,35 @@ static int dasharo_read_channel(struct dasharo_data *data, char *method, enum da
 	if (channel >= data->caps_found[feat])
 		return -EINVAL;
 
+	if (n_args > ARRAY_SIZE(obj) - 2) // 2 fixed args always at obj[0] and obj[1]
+		return -EINVAL;
+
 	obj[0].type = ACPI_TYPE_INTEGER;
 	obj[0].integer.value = data->capabilities[feat][channel].group;
 	obj[1].type = ACPI_TYPE_INTEGER;
 	obj[1].integer.value = data->capabilities[feat][channel].index;
-	obj_list.count = 2;
-	obj_list.pointer = &obj[0];
+	for (i = 0; i < n_args; ++i) {
+		obj[2 + i].type = ACPI_TYPE_INTEGER;
+		obj[2 + i].integer.value = args[i];
+	}
+	obj_list.count = 2 + n_args;
+	obj_list.pointer = obj;
 
 	handle = ACPI_HANDLE(&data->pdev->dev);
-	status = acpi_evaluate_integer(handle, method, &obj_list, &val);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
+	status = acpi_evaluate_integer(handle, (acpi_string)method, &obj_list, ret);
+	return ACPI_FAILURE(status) ? -ENODEV : 0;
+}
 
-	*value = val;
-	return 0;
+static int dasharo_read_channel(struct dasharo_data *data, const char *method,
+				enum dasharo_feature feat, int channel, long *value)
+{
+	u64 val;
+	int ret;
+
+	ret = dasharo_call(data, method, feat, channel, NULL, 0, &val);
+	if (!ret)
+		*value = val;
+	return ret;
 }
 
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
-- 
2.56.0

