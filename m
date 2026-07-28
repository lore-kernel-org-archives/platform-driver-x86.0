Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFBC3B47C9
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260742; cv=none; b=m1n5ihSqPLNeUXHhc9cr8ZgxZ/ZVggxTo+ThShqTHGiHjUUc4PyrnAyGuKhz2dZWzprc7yeIQDy2NJl5Vu0EYxsULNlz8VxOOnLUPlh3hVBChyndBb+WKpGejVONkoa8zm6xa1Vl5veC9MoillNAc9yvqFEHHthAgwDxNzru6TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260742; c=relaxed/simple;
	bh=t44lY22s35NEeNaqS+Z3V6CASIdAbd2ynB7Wy9hB8i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lzbt2HDMq+7BSaz+xonED+28n+Tb0dVvShbRg+KOaj7DOEaEL2KO8iqoYhG9JeYVFoZid9myhTnW7wmP/xSKl/KxBvBwWCM8Y/x18tiyXJC8vygDFLRS0gIelIWfDiBGBHd1wHSu3e2KY4R5yO0crJsyAW0bwJDUPKqf4eEIz+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9bAwFiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cP+nyc/A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9bAwFiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cP+nyc/A"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHbgd83883679
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1YYujMqkG4tWK2IP4MSkxSdkB0+eWGpWly5CPNr074=; b=D9bAwFiMNg7yNpNc
	2CQpjMGPTn0WkKv5ziO45UIsy0BzmBXAnzhX/WeeWn+pJvm0m7X83SAjpyulqiAk
	qT3NjLow/MCwv7/KQ5Ce5BwDMZtuqlFZpe02LfARo37I2phzXQPJoOgNcCOADRFj
	+s0+QaJdol0qivm/OnxAn36hLgxZIdlNrYOB03pV15LxXjEdaFiW9GQOrnlTOfC8
	fgkL2lj+xOfxNOgCeJILnaBE4lkCQ3w1LaUG/pW2VE/g0C96aaPkPFBpdH39ZYte
	yBkZleWfXGivmUnmULubUhDHd+Sc0lSAnfpNZKfSj1uJRgdJACJPcux9gTiL6jhK
	yGpHIA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108r13u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1661a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260740; x=1785865540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1YYujMqkG4tWK2IP4MSkxSdkB0+eWGpWly5CPNr074=;
        b=cP+nyc/AJ0cXgvtkUyR0kBA1biQUH5MJAymopvaRJ50/5uNo4SzP0VlxEKT4/iyUfl
         kSiDzKnbWRxV50BGlN0WRvroKxCh1j2M/5URF4TYVqczqkX4WpRP8OJEM5atdlPpI5k9
         XQ9NZBldCTezBaAnzp01vdKgk7N+lvPfqNEGlqnfCGs2TGAOyODbGu0xfSyWmU/4B+oJ
         ZFoFxhTSDTH2RDe7q+Re6lvikX6O/AAWcl3YMVcWR3n40iTBG+sI47oDyvcMIH0ti00l
         ITFqV6hCtt3BDQkLti+IMZUgg1W2UAmPQU3GbpkNfXNkVrFIVVn2KGZFTnT7maVJSis4
         szcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260740; x=1785865540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1YYujMqkG4tWK2IP4MSkxSdkB0+eWGpWly5CPNr074=;
        b=PHVb0LMgun261IQIItgrIrSz+se55s1We+q7nGyzT0wY4KoywYjkOjxT/NnGmtH4cQ
         wsSCGo2Rixxbf2GsyeHHcxDK7EN8BBrlRj48f1WHcf4Tc0rx+bsd6U+41A3OR0ipG6HG
         Z/oxLZpNOZXbgaFUImJAIkO3XetEi6A60RoFa7kETTkkBpAXMKXN7EgjD7hididiv7xw
         gURhS34y5AC0E1G81z6xHIw1U/3SsRrs4tkaqdwJg5+/vobGp4VFhLuNqV9hhjsjkLsm
         nBrfGv5E1A1cT5nNoylEu9GAoepOVzvOUwLMo5sdX3++jC2bVVJ89HhH+rRWOSOagqwx
         vASw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh44V7I7MAARZXC5Q9TJ3a65UXzqKl3Iu72dLsvn2aL0XbOslU+0Z22d7rZXhL98z+CHQIXySV4L+XL6/OR3qcxCh0@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/6JBuPYkUeGf7SXftAaBNYVNOSki8d+BoX5NtODyd/rmKlWB
	hXE3JeBGpIP9uusb9vW1K4V2vyC09gbtLbOnY5awWB0qg+q87qNKsVq0eJEzN5pCqR+epYK/asE
	qvrrppxUxZNMR1tfSebt+zh59Z7CxLqaMpH5KzdnJL01y0Rtae8+ku/1GuNR1VN4SvHRqCwtlm2
	Lu
X-Gm-Gg: AR+sD1200EjXrN7na7/gnSPlzqkuU9SimqnOPb3vrclmEmG0KdeRvkszPxJw/vCL6sB
	cGfwj2BzhVhzYqRKnZlOdwkl3RblBENtYa97bb4o/2n3nU8P/EUAbQIeot5zEQ/yMjegjwuFB5h
	hzqyXk1WHoQ4OiJeatQzefb5hce8BOwdvKNVwI1BfFk+tigFHTtjwMS+T4B1KhNZjHfRnUWDOpf
	kNX+9y+CSgGt7bh0LbG9xHY19whrBV9B+1m5DNg9Oziz5fZMHttEFtD+qxjhNchFSCb8SgHigLg
	VU/k4WY/mIYXPMGjBD1yyJqhsAGWQ3AgbnIylfqinQF1Hwyo+qh0FcaSO3v7SjMjaSJa/JZV8bM
	f7I8nxim3jkOHXEtWa4x4TDkzniymearuw5/bN2szjhMYxFXUuVHCKDYHhoYLhfKCVkpqjmEmna
	f9x+bwnHA4RwnD
X-Received: by 2002:a05:6a21:339f:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c8aaf9c597mr4605562637.9.1785260739603;
        Tue, 28 Jul 2026 10:45:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:339f:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c8aaf9c597mr4605519637.9.1785260739030;
        Tue, 28 Jul 2026 10:45:39 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:38 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:34 +0530
Subject: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers on
 NACK
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=3402;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=t44lY22s35NEeNaqS+Z3V6CASIdAbd2ynB7Wy9hB8i8=;
 b=MrRZiNl4voVXf4hRnRJ8F06/N2JEkPvmDNWY02iNeBScF/2lUgP9On8XD/rF/dtSeM7/rxlvK
 zTzwWjST1EdAhEws4JCuWMw9je5aUF7DCplWvhyRimq8CYaZsnOoWp0
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: cxkyOve1wxr9KJqRfouzEF5Faut8tXRz
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a68eac4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PsJaXn4vnLjY93LmvYYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: cxkyOve1wxr9KJqRfouzEF5Faut8tXRz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX2aHURtZ0P5aH
 NVlnuLpGDdEe96ts7fJ4xw5e4cSsbvkFnJFFe/7LOhzI3kOJR77XRQtJ/p+gCAxf6i2SnbPD4Xs
 FbrIbvRoKAxpIfe1hTM6CxDZhMjO4tI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX1ZrNga9bEsh3
 7fe7JAi1uF2Yp7Kl6aoIuo+/Tl3aACuxYryRYoq8KQYHcJp7Uf79D1/P5ZM7TPejhswuUjgXU7O
 Hn6/OOwPL9ZRcH5fDDYPgLoXX5Do7FpTHL53qRR8tb7TElFJAjeQQXp0upVcQL2xjYhEK6Ofpwb
 tu2dk50mlevik7DCr2Iwb7xECRDXy9avU//O/rfLF3EpZ9t/DaJB7E8Zk8oncRWd+1AECSZZ1QE
 73bu2i4/rpUJ0cykMJqJvs3I/vHLkW4Imu2x++RPmnFpP/0VWph0gR5c/OFZDPJZOkbWyuhLDiU
 5GoraFpPRN3na/N4i/roK5MX0bQoUPBIaABZIxe5MQuukKXZmv0FJ7M8nD18GWzf/A4oCPzmXC0
 cLhc+QH2QJtWWjbj4zKkD3oTMflbhQhKvCHEld9HRdYL1QniODol+4jUcg7AgUT63bTdWPSFmEC
 GmuaiM55XWnJ92W4GvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280156

The EC firmware NACKs the bus instead of clock-stretching while it is
busy servicing internal work (e.g. right after boot, when it is also
emitting a burst of SCI events). A transfer issued in that window fails
with -ENXIO even though the EC is otherwise healthy.

This isn't visible with the smbus-only command set used previously; it
surfaced while stress-testing the new fan LUT command on Hamoa, which
issues raw i2c_transfer() calls more aggressively and is thus more
likely to land in the NACK window right after boot or during an SCI
event burst.

Retry qcom_ec_write() and qcom_ec_read() a bounded number of times with
a short delay when the EC NACKs the transfer, before giving up.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 40 +++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index a420a180a194..122ae27c2b48 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -64,6 +64,18 @@
 
 #define EC_SOC_TJ_TEMP_POLL_JIFFIES	msecs_to_jiffies(125)
 
+/*
+ * The EC firmware NACKs the bus instead of clock-stretching while it is
+ * busy servicing internal work (e.g. right after boot, when it is also
+ * emitting a burst of SCI events). This NACK only occurs at the address
+ * phase, so retrying the whole transfer is safe. Attempt the transfer a
+ * bounded number of times on NACK before giving up; a genuinely missing
+ * or unpowered device pays a worst-case added latency of
+ * (EC_I2C_NACK_MAX_ATTEMPTS - 1) * EC_I2C_NACK_RETRY_DELAY_MS.
+ */
+#define EC_I2C_NACK_MAX_ATTEMPTS	5
+#define EC_I2C_NACK_RETRY_DELAY_MS	20
+
 enum qcom_ec_sci_events {
 	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
 	EC_FAN2_STATUS_CHANGE_EVT,
@@ -233,11 +245,20 @@ static int qcom_ec_write(struct qcom_ec *ec, u8 cmd, const u8 *data, size_t len)
 	msg.buf[0] = cmd;
 	memcpy(&msg.buf[1], data, len);
 
-	ret = i2c_transfer(ec->client->adapter, &msg, 1);
+	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
+		ret = i2c_transfer(ec->client->adapter, &msg, 1);
+		ret = ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
+		if (ret != -ENXIO || i == EC_I2C_NACK_MAX_ATTEMPTS - 1)
+			break;
+
+		dev_dbg(&ec->client->dev,
+			"EC busy (NACK), retrying write of cmd 0x%02x\n", cmd);
+		msleep(EC_I2C_NACK_RETRY_DELAY_MS);
+	}
 
 	kfree(msg.buf);
 
-	return ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
+	return ret;
 }
 
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, const u8 *subcmd,
@@ -281,11 +302,18 @@ static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, const u8 *subcmd,
 	msgs[1].len   = resp_len;
 	msgs[1].buf   = read_buf;
 
-	ret = i2c_transfer(client->adapter, msgs, 2);
-	if (ret != 2) {
-		ret = ret < 0 ? ret : -EIO;
-		goto out;
+	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
+		ret = i2c_transfer(client->adapter, msgs, 2);
+		ret = ret == 2 ? 0 : (ret < 0 ? ret : -EIO);
+		if (ret != -ENXIO || i == EC_I2C_NACK_MAX_ATTEMPTS - 1)
+			break;
+
+		dev_dbg(&client->dev,
+			"EC busy (NACK), retrying read of cmd 0x%02x\n", cmd);
+		msleep(EC_I2C_NACK_RETRY_DELAY_MS);
 	}
+	if (ret)
+		goto out;
 
 	if (read_buf[0] == 0 || read_buf[0] == 0xff) {
 		ret = -EOPNOTSUPP;

-- 
2.34.1

