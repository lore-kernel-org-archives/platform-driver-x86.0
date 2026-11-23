Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.165.39.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431529;
	b=UMRYpw60MOn3Yu6teK9Po+MbKESA19VVmnRFJxfCSSmTbqqwAGtemz5972agZt2xR+dO
	 GLI1jf8TacFJtIWY4I0rD97lR5K3egKMCOHxYsN5zYEUieV+1UD1ylYsaBKBsZRr5HC3n
	 trtJD/n2EeMc9zeZifFu/oGWd2oKNiqlBJwT/Ffm0kzy2jmCByGe8TOKr61sKzMIvCT9D
	 onYPcF77117pFso+NAzlvsAG8jM/rkBVQHGT1MJGVLeu8UWbRWKYb/uLSViB0BLgvvzFg
	 MaQCBNVEHxPLFGctKvnFv0GFSnTUEQMw7edbfce405N5sVXlwMlwPg7aqn7FrjuMiWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431529;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
	b=I1tzW4dh0jbKTEyWt9Ce5aDY2RvMAv/ePQGj0qwZGu4N8xn8+SHlJx8f0NL+ZY9mMfD/
	 P4op4T1zdjhXVt2je97hMFk0denDZ9cDzFX0PfVTc1hxFHJtRwepy50W5EtSJjsFnKtjL
	 oO9n6qla6krWKO6WWt3kh6os7r1XlkrMHDjZaoioZDYpC1r5HmS2vBe3+lP2lnUmInfiK
	 GJlfIEmZMOaQX6foZVqhu8+cZOnhsd5jhW0yo4FuSjO8P1WyKiiR4WmDfJQmx1H+JNPg3
	 wDriEd4YL1FzXTEiXTN8hgnSsq6tCVGt4QaaMfQS2N3OInrTHD5ssuV86ynOIQEC6HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b="O/H1LJ0j";
	arc=none smtp.remote-ip=188.165.39.161
Received: from 15.mo582.mail-out.ovh.net (15.mo582.mail-out.ovh.net [188.165.39.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452A606A32C
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 10:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0452A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=O/H1LJ0j
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.58.117])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4jY2xD0QDyz5yp0
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 10:58:40 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-n2gw4 (unknown [10.110.168.167])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 88CE7C0144;
	Mon, 23 Nov 2026 10:58:39 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-7ccd8bbbb6-n2gw4 with ESMTPSA
	id ObWlFF4cBGvNugsAptLdCg:T2
	(envelope-from <filip.golas@3mdeb.com>); Mon, 23 Nov 2026 10:58:39 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002f90511b7-fe43-4655-9d7e-26a1e09181b2,
                    0A512C1CF0928FB71961449F2A077E304137B0E5) smtp.auth=filip.golas@3mdeb.com
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
Subject: [PATCH v2 1/3] platform/x86: dasharo-acpi: Extract dasharo_call() from dasharo_read_channel()
Date: Mon, 23 Nov 2026 11:58:19 +0100
Message-ID: <20261123105821.305527-2-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261123105821.305527-1-filip.golas@3mdeb.com>
References: <20261123105821.305527-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 2044634231904923631
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTErAGWDIhDAmmUw5Dcw5mhi5B/4PFjYzh+FFWuHb4zQf5HTh4PWkjVfNbXyuhtFva7PORpTwu40kxu+I5Lb0yQmC6vrYcK7aq2p4pzn8s7P9wOSITwql5MSfAfKz8G46Q0kR9K4JlN+9f693ty0G4JU5FGasqyl0V0RwNLsfFK03KYDaH9PKxIlO+Lpd6NBwIiJx10ej/JdcRw9PexAyk7Vi1UC061pBqW6s/ZfL1m+MnI94eZR7QDzB1e2vYbUBHy1KMIswZ4Qny7ixpPQIcMY8QSKl0MtCfAUwNUmiNnwSIsoNo7zjGqtWT7HXSpsI88QrhrqL9Xke/1gKfHREY4aGQlwsWgIkaC3kx1TY4N4xEEA6ffg/gIK5KPoXxj6YBt0UvwXpISjw9jyO9neksu2IFDyC9+2F0fpLIPCOYzoiG9pyRmY6ziZbFDkg7GVsEEipDBJYePOA7v548b7roZDeqTUGATN5EqZUFpJcRogoRXvAlYAKaPeJsd496+CIVkNAc18L2GIifwlPeTNe0QUahEEGJd0pFHl+Uq+AqeO4ynlPMCRtOdsww9rb0WfufIXwiSJWPobweAJKj4ZvkPwgA49JdfRUyq4v7OXrtKiRLRHZeq+ssEtvRGh2vezatp5aD/MPo0KgpHXCNf9rmGw/qiePkASG88YB8EQKNXiJA
DKIM-Signature: a=rsa-sha256; bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795431520; v=1;
 b=O/H1LJ0jQ6smI/gQrsm4BZBFXJ3XJN0uCG7KhphGFBW008mGXIYoOHmKFXcQH9/H0Z8VDqm8
 thG++IX3PbCLWyYAnF1sOFMKBGUJ6VIrBa105uw5kxnBfntSHaKCcJswIXYU04kI5nGQzTFtzez
 MSi467cc4I0IJrb8EV5MVSVE/HPCD5fsktRv+i/7k5xTIjmJEwREKHsiCYsOuUbe9HdqaQgpUVe
 sNuUWokfHVwaSq+H0LEe2J/EISh8N3krSi8QQZskM61EEIDTTZ1zXJbSGFExn7R7nyEMMhLbDk5
 3+APdR7gkt+SZgalAEeLG5/qEqUHo8Og+pvhWWe+JB4lg==

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

