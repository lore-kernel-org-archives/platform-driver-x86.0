Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E3951CF65
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777935; cv=none; b=V3R36qZ/lDe8qfrUJVAxokRrEJDYiMqCS7YqdEyz7Gg2chz52LUdK/hZKTDaVtXTROlul5lE+7A07FDA/c7Qpk0mX5H4sxN8n6nQs2sxzkMnYnu2JCy8LmLjYvjKmPA7laLtvTKAD3nnjy26rUKwvCPv7fdW527cr/Dh9RGs8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777935; c=relaxed/simple;
	bh=Zm8g3oz3CixIaRv7oE5kxbGfu8YwCAXLueO/nrs5VlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ObDIHVairiPBA3NBZJPOgkFa1arYW2c3Qd7G08dLMI+A5OxvuB2UVhdjSZGGlpVPk1jzQrjTyW2+Qs6XMfr9tUcnmhpKDlBvS/d2fv3qGvKeCQyTFQaSTP9V6X2qsMMwqtZqkf/+jWBVovAE+NBZT2iFWxOZTzZJy7pfFRFb7Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVof+tCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yub9wDrk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVof+tCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yub9wDrk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0B4i3283827
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7bpTUMb3ODR4fZWLx9HiLu
	8A5gFtV2lcsTUwtO9Pqao=; b=nVof+tCLqQBe7mXow4oTRma/zpt2zBN+ytou5j
	d8R2DOwcoTGwIHvYAG39TDHTTV+8k3ocZ3041Wvr7NmCyVz+xwLHwbrZW2C0LCti
	iUwMJS52KtrY3vzYoa5kTtDJBDQD9G2y25ofDpgCzshs8V028dHWPcSAbD0nVBhC
	jdpmjQhfYJScAWlglHma3pdCP7YC5ydlTvf8ceaq9bGaIAjWsqvSLjjtr9fry0zs
	r5h/Hx+J88DPQyiKbzGR6SiKZSO/ZkW2L/r6AACAXeGDr/mY2597J/ovcigEZT6Z
	kc7/9fwF2bccNiY5no0WavLdFvKv5Fw3x8V1XcxPcUmDm/1Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0tkn2ntj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:18:41 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9806756ea40so3916608241.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790777920; x=1791382720; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7bpTUMb3ODR4fZWLx9HiLu8A5gFtV2lcsTUwtO9Pqao=;
        b=Yub9wDrk6l4srXeqWmXJTQ73x/J372FbdhyeMUY2oF+DHlb7iSkQ7Vac00MTw+1DLS
         qPZ3VIVJQ3D+zDtEcL6KgHaah2+QIXDRMTKydCZ0hyzPthhtB5cEYEW5HwoFFy99SCtB
         tw7Fff3t6Y0AIsjmT8eigteM+hNCGrpa5lEJmn3sRFpWeWkfmsdkjHxsKg9tNEqKxD7+
         ugGogAnKum/PsT8u5neiGZb2jpmf+5dv2HRpkHEZH9IbA8lEh6mDX+dVhb6q8Cldi8hR
         TALup3+n4xWBOcqqwUpHz4C0V18lu+jUmYeLBeV44n5AcW1zMsn5qmLAPtfrQ5oyTDAE
         HZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777920; x=1791382720;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7bpTUMb3ODR4fZWLx9HiLu8A5gFtV2lcsTUwtO9Pqao=;
        b=i5ylD6WTpO3krqC4G0C46Wa+DX1rELw1/Hfn89PztGbOhJVkgbbBlpbhS/IPvbYPKo
         CYTh1eTVuDt3aR6ZcdxXJNKAEhlYJ4NzwgHE+CDDwP0GrN+7+Q2NRIHFNsfSBW5/9hwt
         6Bib8enwu+HjrPrwtdHGSRQ6nxNh0v5Bsz1if33NDAkF2o+sLQT0daany0k62NEh4u1h
         n+G95Cs2AQFtP0xOklRmUUhDJBDQ4OlGAWzxWU1qyaG8Z0GPDcQKFTNjSKht8jAlxSc1
         rlonn8VVY2PICaMM/4kdBSO+hPM5QXg9q46RA6oRLSxeg3JLeW2gxgDf0RPGBRQoF2Ay
         meTg==
X-Forwarded-Encrypted: i=1; AKwUvBzFnMnShz/kh6sTMyfG0rV52CmCGaE3/QQ4o4FjYAm4GjYGYfo6P3nyeVVGlnbp0lT8+UBXDuUSgoUQX7P0XPNeKa+I@vger.kernel.org
X-Gm-Message-State: AFq9FYJdLFF4hye3/RPPCvRe13kl5EjnUIziSKfoMdFxrKKtUnn7rJYv
	5ub40gcy2/eaOKlg5nP8qOQldjWre88Zd2oFJniPqLCyDnEeqQFthjlowYQylxTiQaBMwW/mMUj
	G372s4S8sOdz+qUSzolVEQVZ0zJGN97xIzJ4+RDkhbAsdkYdHhVNhWQgJUuAfXlwxjOgzwSK1aM
	90
X-Gm-Gg: AYBFou0Ih2DrjU2zir5ExVuB3EBysloFX+K3sRRWd4BY3rFQXFlKee3WXShcFJiBc6Z
	KziqsQnhBBzC3b2Ugwv1o4dbrwebFv8T5h8K1LeiQvR6xsWxMiUuCIbS4MXmLFd4srKepq7a0+0
	MmXaJ+5NbGEIPamGEBaznYEzC2l6zvsim4SPm5GkBP+ZGWQ4vX3DekKoO/I11MzA4+rxP2TQKw9
	6oXDlRe5nI0GL90MuZvOgDmy8R+3MxHa6xySWME4hdbSPi4579/BPp6uApzzgFNTBXxnXgp/X/S
	9ozCW95vBx3Usw/rvfhECS/g41HO8meW6VGmsZVISTU2GqUy54wN5vt5SYNSpFtolvLz8HReW3q
	44Zf2vjZI
X-Received: by 2002:a05:6102:26c2:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7be749844damr395652137.36.1790777920164;
        Wed, 30 Sep 2026 07:18:40 -0700 (PDT)
X-Received: by 2002:a05:6102:26c2:b0:7a7:19aa:8a89 with SMTP id ada2fe7eead31-7be749844damr395629137.36.1790777919567;
        Wed, 30 Sep 2026 07:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e6607f4sm2469335e9.11.2026.09.30.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:18:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 17:18:36 +0300
Subject: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ during
 suspend
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADsavWoC/yXMQQqDMBBA0avIrB2IqQTaq4iLOJnqFEw0U0tBv
 HtTXb7F/zsoZ2GFR7VD5o+opFjQ1BXQ5OPIKKEYrLHO3G8GV0ozTn5OHplQN104BpS8Yutaaxr
 yYXAEpV8yP+V7vrv+sm7Di+n9H8Jx/ACFJCDpfQAAAA==
X-Change-ID: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zm8g3oz3CixIaRv7oE5kxbGfu8YwCAXLueO/nrs5VlU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqvRo9FA4yIVKJXL+Kzp0rMyPHbfKar6YpEERZP
 szziYSGNCKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCar0aPQAKCRAbX0TJAJUV
 VjzOEACy4OimnPkZlHgRrvsZT8P4bvWbQmur/vPBuYj3aU3aG4Fqm/xtVP4T2qqWmNloud6hAGY
 0Z0RnZKny+IUQxeJRAYwm3lbX1cdsE7DScC/k0jfv2npAu0YCQE0WWE8DXpY8zSWa4VN/0bj6BY
 xm6eCHa4VHy+OCmerHb61cltJu6QSG8wBGoqcCxOpTWMwP9Zh1xtYqglHPtXGgYLA6Iy/KWU0NE
 tGhoisF95+75SnuR60QoyPlZ6a7Nps9211QMQpvof5rOhvj/bvvwUdqJ/33WTB+3YQVChAjBtfo
 8sAR2lrhNDD8k3MHtVXgr+HELIZ25+Xm1cQ+eNecwL78jTQCgbBkdUM9K01pmLmm89d5UsuheVf
 BvhXl9z1Ntvi+jK9KYeoDAY7coMM5shguT5eVOHaHcV9YigSt8RLaFhBlXUE9Hvo1fD4p9jy1dh
 NUl0w7aXHC+KBjPCaGU3552mLCrbNjZLXjrwPEpzbqIgaF4hHMveXlCpNdY/vDEM03sBNV1gAoL
 Bj0n9nlDNdr1B46jTwtzujI8OZBHXhabWVIAKBv5CkprWnZtk76rOVRxETmcHN58YsTM4DwY89Y
 +roMQasY4nWOMCpzjHMPZwKxPzNQCm6vDGaCcItisGBnYizivGwXZz7YSUSFr7/f9JIabt32DBJ
 3+GZcHfQP44IsWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=CKy/zhrD c=1 sm=1 tr=0 ts=6abd1a41 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qH2p2g-4CMqcrQuKSa8A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: NYzqWrQiWMbxyscI7xSln-OpOVpdgBMA
X-Proofpoint-GUID: NYzqWrQiWMbxyscI7xSln-OpOVpdgBMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfX3IwCZaIEIxJ5
 9yXmzdmTvK4KDm4CUm6ALvY9LBa24t9Qf7DTlwy5BzB9dEghxod02ySAFs9Ayg7dJGYTaaUdwzt
 1bqNbbrksgqWI8a6mu9jtm29UKuL84zuj62OQ8bMFs4GmC2VrkRvqh8YpR077IUZq6DnhS5R3dT
 8tuQ0dg95pjdJuYPpzZ7tHwFCf5D2hm+WZWb/7w8zmJXdwtwUZFQMb3tDBA0tikvE9UOhlPmJ7z
 drwnE0XPgyuLKWxMXXbhhma5pcNZkSRA4dLBJMmNSaK/Va4CjkmQBxzsnW9Yr/Jt4ShzOz0aZDV
 +IZmLskBoh1oOkN0XknxDcmPZobBwUBMamj13vINKttr8LbwrfZS+WFHMBPxJlHLmIImMakrS/i
 yl43jM9zzYuJ3hfKPEP+t1L2czEl6b3BXTjhw5lmt/OWuU4puexHJNPN6G8evkUDQgGV2G5amGj
 /6GyWCeme+UX0rilsww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NiBTYWx0ZWRfXyBZrckBVMOjJ
 PVcXSSnhMr9mmi6lAJ4PYYUxvEANwKO6ht4lIk01hAHS9KcGxCwUzY/Wixr1YxHClaJ9y1nkW5X
 SyvSDD/Ra0REGcwQxonWy/zOqEYUCGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300056

EC SCI events require I2C transfers to retrieve the event information.
During system resume, an SCI interrupt can be delivered before the I2C
controller is ready to handle transfers, resulting in failed event reads:

  geni_i2c a84000.i2c: error turning SE resources:-13
  qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13

Keep SCI interrupt handling disabled across system sleep so that EC
events are processed only while the I2C controller is available. This
prevents event reads from racing with the controller's suspend and
resume transitions.

Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4d2ad042a7f8..d34afd901324 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -331,17 +331,28 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
 static int qcom_ec_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_EXIT);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_EXIT);
+	enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_ENTER);
+	/* Keep SCI reads from racing the I2C controller's system sleep. */
+	disable_irq(client->irq);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+				      EC_MODERN_STANDBY_ENTER);
+	if (ret)
+		enable_irq(client->irq);
+
+	return ret;
 }
 
 static int qcom_ec_probe(struct i2c_client *client)

---
base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
change-id: 20260930-qcom-hamoa-ec-suspend-irq-464201cadb6c

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

