Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385AE13C908
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744580; cv=none; b=MHPK2Rj67UZJHyTHgHZzcPbddJJIZ1R8cd7Gz6sxc16ZDzjeCUSSEHSmt/YMI3qxtNnlaF+cAbyqouKO3siyKReT39EfI7olV3shHKQ9RqPUgODcz1T4nF2pg0ceaTKs9QZfLixpIUGFJv+IMSEF1vSjZr/Iaa3avAyGfoLx4q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744580; c=relaxed/simple;
	bh=aa5m/7BK7/DbTvlCizArErjlcAXnc5ec7jWXk2pJ/iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TMypM6lm6rqicx82tmGctls/s9Cbiac9MrtHSRoC9AfigIizTkBFWE2cQycndE6uxAq6lh+sNAPlR3eInJ2wkRljOHQrTLM7sjxWJAx+qHsG58rSc8TrFL+hzI204Iz3IXMEo2NNOP7XgflzqsuLLv83fhBYh8nRq7DZbu53420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXHPYJ6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dubEktmD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXHPYJ6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dubEktmD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPkNV2011459
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=; b=XXHPYJ6FeDHCsKs/
	gTUZP0A8B7VEKvxP3/ZQGrMcRXiqJma6U6+0a/4UEXZA0tZePMhR+iRHKNDFiyVg
	n6qigTH4VHX6L7APsHkzod0dTpR3Yu0H+of2UFG2Djj0yoazkdJY8U4deJT8Q4hP
	LIvrlHDOwI/8brieRCU0HU01XTWNdak+F11htJRuWD9wzXbkvKTZDzEKTLPMv1jh
	lP8KCFVTsOcy90kUEEbEwhNFRXwUqB6UyTLj6x7DZuzn6aBxoisjefLP5ej15iiK
	8bXA/T6czpOtTnNCeNO8VoVmCkSzHlgFLnK0xPiR0vLX3Q2p75L2vlUK1iZmqyz+
	OA5Hmg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j0ejfj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 05:02:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2e064b7a6so3219225ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 22:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790744577; x=1791349377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=;
        b=dubEktmDVSYFkT/ko8QB7z3KkMfqH1OTx7Xa+OzOGxI1BA4O2FAYcfJiY+VYNWgLwl
         ZudxVVAGLuWbQ/bQoJ33QwerQo0yjfFV0MdDs7G6DaT7xPQI0kTWqnyO/6XgQOtY4mPb
         //Yy4K1/qCWtIF/1ScLcxMMdjG/MY1+LT9PXUc9M6helcaXnNMwAmCDjXVK7I3DQlCLz
         8/w/ckFfenYni1320JBTbfFeMoIunSyF2XPwHtiAEFJ8srVOP2vf7iEOfu9znDQj/THV
         ujIMw7BUYp0f21h3I6OcgHvmIwe+b6GRf4nzkLIKsnJ3wZgkH4vnshXZE1LCopZPMoT1
         qqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744577; x=1791349377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkg6ZsioMZw6EFu9fkXHTIgiUwtXNeSZKmXw0kdl0wo=;
        b=vTQUV58fie5CZpEHjRxUBiKMKHF3jozkBOZDdKvg9t1DDFctYJXRM7QlegOv+LNMuQ
         CeMTSXL2Xckm73HiK9LTX/x4FPw4Vb8+PaUuIcuFEV6Y0bzHNR+gCiapmE3kmaVLcu7Z
         FLXxjgiXz2q5mCrBJOMn0tnTvkt2q7UUeRz6gHfFBpYIWQK99IXiWNex4PfmOnmwdSOL
         eLgZwf/KOcScJfFZHYMQ+xbj8o72eJOKXBKSXIqyQoieWc4TI5RsL6/25HIUB6hr9ch/
         ckMyu7qd8/nO3YeAUThGk64nH/9lZnMkxHOMeZOtKaLpr88bp17NhH/dNMx1ULothabF
         bddA==
X-Forwarded-Encrypted: i=1; AKwUvBx1nDEkOFjFP+kK5wjlHBQ9gVkk6aEkpin0TGVm9CHcHLDABMswAqhDQaebtoyA6yP8BD/5P1X9jUeMntVkPLRNTxFl@vger.kernel.org
X-Gm-Message-State: AFq9FYJQyNmajIbANWvZ4ucOX9X/SttRZneAd73GC0hNitHLy7nkhT69
	aMcWqiRZmIsgADFtS4IuDOzx5O/ExuxYCDc3hwzKMDT18CIM6RCu2fU9CALXyb5mxBvmmR9/A7g
	kDYlM3r7EaVRrdHERmJI47fbfnZ7LVhBQ8wWxyRSFe5hTBD0oxXbKarkDxuLDuzuB1Grc3c5A7V
	ht
X-Gm-Gg: AYBFou1ZphNF9RdiCA9WmbIX9iRH9JazXwbqSIibH6hP5zHOasqSscq9DYyka98LXQV
	l2HSRFSYkE3BXeeUmKGIh0idMcHd4NBhafl6uJJ4Usw4gy8OxCbUSyYJL8P5a5Umh5CEjrC5NUK
	DxjKoNP2p4NJd7IPgJvXKMaWvMa0fFMrJmyZG6y8OdigQcyIJXu7+uEIDVYdBicN1miI2UDF5uQ
	KEliCx9NfTQ1M/ZXtt5Q0M8rji11zau2L7dg2DULB1I3wliiK1N0+c65vM5wraPl4/5GCrMfoE4
	J2FGbUrVUNI5rvEsiTnLctv8WF0ZXU4/Ja8SbpqSyWdDe6B25ctVre9lXB6qP7jywpCZY3b7U2t
	ZabIR1hfcJ/pKjK1FMkF6XPEBVKYa
X-Received: by 2002:a17:903:22c5:b0:2e2:bf06:25f3 with SMTP id d9443c01a7336-2e2e4b4b833mr2228615ad.38.1790744577027;
        Tue, 29 Sep 2026 22:02:57 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2e2:bf06:25f3 with SMTP id d9443c01a7336-2e2e4b4b833mr2228205ad.38.1790744576104;
        Tue, 29 Sep 2026 22:02:56 -0700 (PDT)
Received: from [192.168.31.121] ([152.57.6.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5bd5c67sm758105ad.48.2026.09.29.22.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 22:02:54 -0700 (PDT)
Message-ID: <362c6465-66ac-4ed7-9e7e-f75f31b32dd8@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 10:32:47 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: qcom-hamoa-ec: Add thermistor
 sensors
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-2-d9c1bae4cd0d@oss.qualcomm.com>
 <c15405f3-db75-410d-045b-996db4f83110@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <c15405f3-db75-410d-045b-996db4f83110@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cqgOAF4i c=1 sm=1 tr=0 ts=6abc9802 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZE6J5AxZF9eTCMsEPEnAuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=qvRe1xnp1C8EnQCzoIkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: TGCOALk7PQ8rVUCg0ETcZ-PAXhZ46Aqj
X-Proofpoint-ORIG-GUID: TGCOALk7PQ8rVUCg0ETcZ-PAXhZ46Aqj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAxOSBTYWx0ZWRfX+NLKGL/aDp8B
 BcVWfw5jfg4jnncVK6WamldoeN1ley1l0jEgZKoaQe59B9XTaIgGmFkXAzzQqEj4zNYru9cGBcU
 6bhMacFECrtxKDndTwnk8usq/0k2aHY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAxOSBTYWx0ZWRfXzgO6YawnlVAn
 Ehh3U019fp3l2jCB4va6xQ7CkjCEToNZldSllotfX068655CA7mVwk5v1y6L0IOIDSXHVSAmKSO
 eJ5dMI1Mub5RTZNETQ0qb+mdZQJCnwQ3Ha4yBnLtvdOlmVFlVw2zgr6PmDlay/7CxK8bTLD2tQD
 zPCTt/2RQayRCITeQIpK/XoNWoEBFGp3ciVsYv5YZXdixJ0z9VY3sdeFsFqX+OVLbUKgCChUc3E
 EskaeZNVPjB2QXlSh6c4QHnmagBWWlgJG5l+TCCYef7sZl71FWo/+PrJTF1vqHUzay62VBm3s6V
 BBMgObF1h85UvX+MrqcOgj6e/3h3VgyzSh5IauSQbp9+3jZvW3hNrWZy/M/Aa4jhqipWFGxFLtq
 VEftZt9IO68MzcSH8ZiyCV0pXlCqMbAPcllv5J8tP0Y+P4yGRkWwtmXHO+s24ZIRI/X+LGR5EY9
 T0dTjQlPMX3uZjWvQLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300019



On 9/29/2026 1:05 PM, Ilpo Järvinen wrote:
> On Mon, 28 Sep 2026, Anvesh Jain P wrote:
> 
>> The Qualcomm embedded controller has exclusive access to multiple onboard
>> thermistors programmatically discoverable through the
>> EC_THERMAL_CAPABILITIES command. The temperature values are reported in
>> degree Celsius through the EC_THERMISTOR_TEMP_CMD.
>>
>> Register these thermistors with the thermal framework by adding support to
>> the EC_THERMISTOR_TEMP_CMD and convert it to millidegree units as required
>> by the thermal framework.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 74 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 74 insertions(+)
>>
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> index 4d2ad042a7f8..acf3d7f53026 100644
>> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -16,16 +16,19 @@
>>  #include <linux/pm.h>
>>  #include <linux/slab.h>
>>  #include <linux/thermal.h>
>> +#include <linux/unaligned.h>
>>  
>>  #define EC_SCI_EVT_READ_CMD	0x05
>>  #define EC_FW_VERSION_CMD	0x0e
>>  #define EC_MODERN_STANDBY_CMD	0x23
>> +#define EC_THERMISTOR_TEMP_CMD	0x29	/* + thermistor_id (0-6) selects thermistor 1-7 */
>>  #define EC_FAN_DBG_CONTROL_CMD	0x30
>>  #define EC_SCI_EVT_CONTROL_CMD	0x35
>>  #define EC_THERMAL_CAP_CMD	0x42
>>  
>>  #define EC_FW_VERSION_RESP_LEN	4
>>  #define EC_THERMAL_CAP_RESP_LEN	3
>> +#define EC_THERMISTOR_TEMP_RESP_LEN	3
>>  #define EC_FAN_DEBUG_CMD_LEN	6
>>  #define EC_FAN_SPEED_DATA_SIZE	4
>>  
>> @@ -39,6 +42,7 @@
>>  #define EC_MAX_FAN_CNT		2
>>  #define EC_FAN_NAME_SIZE	20
>>  #define EC_FAN_MAX_PWM		255
>> +#define EC_MAX_THERMISTOR_CNT	7
>>  
>>  enum qcom_ec_sci_events {
>>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>> @@ -64,6 +68,7 @@ struct qcom_ec_thermal_cap {
>>  #define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>>  #define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>>  #define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>> +#define EC_THERMISTOR_PRESENT(mask, id)	((mask) & BIT(id))
>>  	u8 fan_cnt;
>>  	u8 fan_type;
>>  	u8 thermistor_mask;
>> @@ -81,6 +86,12 @@ struct qcom_ec {
>>  	struct qcom_ec_thermal_cap thermal_cap;
>>  	struct qcom_ec_version version;
>>  	struct i2c_client *client;
>> +	struct qcom_ec_thermal_zone *ec_tz;
>> +};
>> +
>> +struct qcom_ec_thermal_zone {
>> +	struct qcom_ec *ec;
>> +	u8 thermistor_id;
>>  };
>>  
>>  static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> @@ -183,6 +194,43 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * EC Thermistor Temperature (cmd 0x29 + thermistor_id, id 0-6 selects
>> + * thermistor 1-7):
>> + *
>> + * Read Response:
>> + * ----------------------------------------------------------------------
>> + * | Offset	| Name		| Description				|
>> + * ----------------------------------------------------------------------
>> + * | 0x00	| Byte count	| Number of bytes in response (=2)	|
>> + * ----------------------------------------------------------------------
>> + * | 0x01 (LSB)| Temperature	| Signed 16-bit, unit of 0.1 degC,	|
>> + * | 0x02 (MSB)|		| range -40..+125 degC			|
>> + * ----------------------------------------------------------------------
>> + */
>> +static int qcom_ec_thermistor_get_temp(struct thermal_zone_device *tz, int *temp)
>> +{
>> +	struct qcom_ec_thermal_zone *ec_tz = thermal_zone_device_priv(tz);
>> +	struct qcom_ec *ec = ec_tz->ec;
>> +	u8 resp[EC_THERMISTOR_TEMP_RESP_LEN];
>> +	s16 raw;
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_THERMISTOR_TEMP_CMD + ec_tz->thermistor_id,
>> +			   EC_THERMISTOR_TEMP_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	raw = (s16)get_unaligned_le16(&resp[1]);
>> +	*temp = raw * 100;
> 
> MILLIDEGREE_PER_DECIDEGREE?
> 
> Make sure you have the include for it if changing to it.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_zone_device_ops qcom_ec_thermistor_ops = {
>> +	.get_temp = qcom_ec_thermistor_get_temp,
>> +};
>> +
>>  static irqreturn_t qcom_ec_irq(int irq, void *data)
>>  {
>>  	struct qcom_ec *ec = data;
>> @@ -376,6 +424,32 @@ static int qcom_ec_probe(struct i2c_client *client)
>>  	if (ret < 0)
>>  		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>>  
>> +	if (ec->thermal_cap.thermistor_mask) {
>> +		ec->ec_tz = devm_kcalloc(dev, EC_MAX_THERMISTOR_CNT, sizeof(*ec->ec_tz),
>> +					 GFP_KERNEL);
>> +		if (!ec->ec_tz)
>> +			return -ENOMEM;
>> +
>> +		for (i = 0; i < EC_MAX_THERMISTOR_CNT; i++) {
>> +			struct qcom_ec_thermal_zone *ec_tz = &ec->ec_tz[i];
>> +			struct thermal_zone_device *tzd;
>> +
>> +			if (!EC_THERMISTOR_PRESENT(ec->thermal_cap.thermistor_mask, i))
>> +				continue;
>> +
>> +			ec_tz->ec = ec;
>> +			ec_tz->thermistor_id = i;
>> +
>> +			tzd = devm_thermal_of_zone_register(dev, i, ec_tz, &qcom_ec_thermistor_ops);
>> +			if (IS_ERR(tzd)) {
>> +				ret = PTR_ERR(tzd);
>> +				if (ret != -ENODEV)
> 
> I'd prefer ret == -ENODEV check + continue.
> 
>> +					dev_warn(dev, "Failed to register thermistor%u zone: %d\n",
>> +						 i, ret);
>> +			}
>> +		}
>> +	}
>> +
>>  	if (ec->thermal_cap.fan_cnt == 0) {
>>  		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>>  		return 0;
>>
>>
>

Thanks for the review. I will use MILLIDEGREE_PER_DECIDEGREE from
<linux/units.h> for the temperature conversion. I will also change the
thermal-zone registration handling to continue explicitly on -ENODEV and
warn about other errors.

-- 
Best Regards,
Anvesh

