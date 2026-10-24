Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792882589;
	b=t8lAxVBlCupdVf0CSXKWOtrupr2d2l8chPpGz5dYfTWqMeU1gu5p4+DnMUundNjRw680
	 ktsgP2uCzYU2fUlG0RHUl0HxurOcKBHFYRZekAaBAGNEV1s/VVXpBUooJUYKOvjv3HEqj
	 9sK+GpEyb12dsrZZUjyrGUDL1pKh8X6R44VT9A6z1TB8S1jXw6yu9/GgmIn/MVq3OeQBr
	 KZ/FKh0K7m9Z/gnRvsS8z/DapzMz2lvTBVDPsF4AM3vkgAZALM9HRrh18RNJwu/xzwtlK
	 PARx8duqQbN3qpsTs82YCIcdd/IJpQwzyugHIF3d96ZCGWdSDx3KK8WXvFMl5Z+3D+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f1HiuzAgbnoiP6XLEgSVQ76HAxeufd2AMG70LmlGRec=;
	b=F0HR4v1hGLkpMqJmVFaCD+wVwL+MRLEHUaP5yDug5j8WP6jiuM+xKWb0REWmH/ZzJZkQ
	 GSLzqEB4DU7/7qq9wn0GDYEksHWY7ANcvUzbkVsmLPSXfOqhmmom9RBFi4LQTT848i+Nm
	 e7GxMRh7VCtSMXp8kNu+2ntwxYMlQx9iz/wn13Chz0HL7mb7NXjqZvb9y3PkTFz7ytZhs
	 k3ePcd3RUQmMAb3IyIknwSkl6hkSYS0GGIqbjR8fq4ryviA5MPtNUC1hgQcGsclp6sVdN
	 qqdf0CNg3LR0QyA/qgKBAXz+FohxrT/4G6M8Drpf7POispQ1ve8lSStxNhO1A7N3BGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PizwXrXp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FGtEvaxW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A432606A32E
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A432606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PizwXrXp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FGtEvaxW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLbfI53752405
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f1HiuzAgbno
	iP6XLEgSVQ76HAxeufd2AMG70LmlGRec=; b=PizwXrXp+SPjrmqdYg9i6ij5B1G
	TZmW+sBXMnfz2c9Y+aqxy87GCWrhPL0G7LlSKAYx13IGlAGMpRLJoPInG4OMH4hH
	eJIFRvx1Vgz3lmQix8QsLjm/kMdkOHTO9XIHp/q97OO+KxiUBOPzuhluNq/YHunh
	g2lGmA+HI9Yc1DrczktFzBFiZ2SJM6D3rfUmb45SfsCfZ/Vun8x+YOQg1GZcDo+g
	7noF6UixRadUdlv/nWdxoo3v60x9gwF9Swkt4D+uyWj3iE6buZ8jUdm34plvOiK9
	Rq0koMe/EHpLMEIHVYHwgbn453Yp1uiimiIWVIESeUol7c3WZ1O1bR3WVRg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkmsa3su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so107254985a.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 15:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792882586; x=1793487386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1HiuzAgbnoiP6XLEgSVQ76HAxeufd2AMG70LmlGRec=;
        b=FGtEvaxW5KKcAB5khzlZF5TTY0puzq5/dNS4AYRkBQ2kV4v7U4wed65MbME9/sbbl8
         IZo+1wYfn6gyhugmRvqoe8m3h1pksqqzJDB+ChCgv3A+JZlpXKgo7TDnnGGI5rw3c9ts
         zLXOeid/TirWP88v12cr4ti8U358o57nw+taK7+T/SKFGfBDBRIFHgGh+k+GSxQpT4x3
         4G+fM84/ZGRHPnjpAql73fM29E+wQnBbnBXeZOZgsCya8haC2Iexx7IxXVZ7t/hk8L5q
         esQjhthhcCnzeFyAMx70Q1LY2+McRh4uUA7OxSMPNbYJ9cZFv7QW7lchIomUou10QowN
         vKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792882586; x=1793487386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1HiuzAgbnoiP6XLEgSVQ76HAxeufd2AMG70LmlGRec=;
        b=HMCDVUa7YKHBJNURhfygPVwI1ZXINRqJ+4wuUH17ZC/XZx7BXWS8JS/YE7rHrf48VU
         elfAqVj7bkSoBczKPFVvmSCS9TaNfShDzpcGMAcwSyIjWdn+TJ1WMMUuizrzdCAG27Qr
         ZxJtaGnhUwqFNzhnWWY0pz9tPlet7A82uGbg/Rdk5QNtz8GvsArRAqRIxCGuqkzwo172
         B6/9LwHZg3SzMklLirjSEyAK2To9PL/ENnSZ2kITQvYWjnTvGbVBhW8Y100uj7hr3yrk
         fgxK1EnIXY6J/OIGuUwYe7n456T35WUfyXkHjf3/0DYo6vusCY6/eB0kI/wECUYunshE
         JgkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFB9/A8h8yHi0oUzIc5dVuWV7KXXFhnNXPTSPkrRtcrFQuc4Ld92SHnYPWTK48Y7B10xl9rhRMdoWehAZU1SMfcqNq@vger.kernel.org
X-Gm-Message-State: AFq9FYJW08NifHgz4VPn7UfLkmVrX36qJyD1rsW/fwNjatD2meRYxQ68
	z3U/F8wR5jaZ+/y7F+uc1dy9eVsutyn48RXMsKVGYJK9fBa62ROGqeRq1KxbfvaTwKyy9VdDQEp
	RwNTbKhLgYruxCzS0J/3aHvrMo2/oLEUa+zOnAUv9vxDp6sUa0Qx7jTxZhrXX847N0ihdy1c5r/
	yx
X-Gm-Gg: AYBFou1alPWwa6mQvlcwsoYwKwxr6AwtnjAbTUT0v2TG2iAlUBs9zpH+XHiQYF1fFN+
	/+tjv4mKdm0Sr2UGblNXF53cGPjLr6BW9Aecd7v6i3ntciRX0tATYvKFBNbgQ6hIVUY9xIUBp1l
	9LMiIJPXCoU+G9Syjn4hIWlqkk0bihUxNALkK9CTdwFDb5tyL2daHUeCHu5npV4SBt7UnKphyYn
	gszKQfkZAnjWjsuTAIXK0NfV5pTqPT9n/WuFayf+B8BtzLJ40gSCsCm0RzZY0XMmLDsuzYZIXq2
	abZWweUepqu2Z2qeBwysLkbep8mC8+uakCug/INyFjJJxxxyzmjp5lSCDa5s9q4PwtLDjTANtWL
	AEo/FiXpo1I5t4zbmq/UMUNQoEc0=
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr453551085a.40.1792882586473;
        Sat, 24 Oct 2026 15:56:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr453548885a.40.1792882586057;
        Sat, 24 Oct 2026 15:56:26 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm98564145e9.1.2026.10.24.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:56:25 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/4] platform profile: Complete class notifications and registration cleanup
Date: Sun, 25 Oct 2026 00:34:27 +0200
Message-ID: <20261024223501.1420953-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7j0E4xt1QQ1KGefgIPC51yx0KyCaCAmu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfXxYNoSuYA7tlK
 JbU22ZQXurJXf0LTkMeeQr46xHOaODgqupVIFFupkx4tisuaPUONGRpeALGeDFxuGzKBpPGNTTp
 j/WUhmJqrMb3kUxsP8gsU44L11NWeDBRGSB+L6NoYD2fXgAM3Ogqi5wLA54JsX1pJ4x5vTBXeD0
 k6MYU/Cjo9mLIq5t/9btz0y118eS3O2qiyEla9KG4BCe3g9rGNgdIOgAU25KbPun5WxdRc+ntC0
 fUNVYHBnIB0un/qoV+cyXehnqLd1ffgVk9/n58qKhu4zbtQafa0gqPiRU7SP2J9jF9XagcQVuKB
 4DSPuTFzeETyRRh9puoIH+b9XAMDGnGlYOAM1n4eWTT+LOeXAtxVslo8AfDVTOVjoOftXWxEVmU
 GSELYkgPo5g+5hkX83KW6H5DIWbpqUXD5KLrJZj0uuggUU5vBrP/mBOr+lf5Bj9B+66kxsWas2K
 rhKkLgJLv7GqtsVgVHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX2MFb1v0TH/MJ
 1ur9qsAPoxt5u1TCeJF6AeEhwSgEMyEPq7ixWVGAzb/l2/zk9Yldjc+z7GKn8U0kEylLqowm/Bw
 YnEVXBhy8NMx/Kj3phydqyOL6RIN2pM=
X-Authority-Analysis: v=2.4 cv=UqX2pOwB c=1 sm=1 tr=0 ts=6add379b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=sNWLPp6fUqVo4Qx2xT0A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 7j0E4xt1QQ1KGefgIPC51yx0KyCaCAmu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240091

The class profile attribute documents POLLPRI notifications for changes
made through userspace writes as well as changes reported by providers.
However, a direct write currently notifies only the legacy ACPI aggregate
attribute, leaving listeners on the provider's own profile attribute
unaware of the change.

Notify the class device after a successful direct write, using the same
helper as aggregate writes and provider-originated notifications. This
also makes notifications available when ACPI is absent or disabled.

Restore aggregate attribute visibility after unlinking a handler whose
registration failed during a sysfs group update. Keep aggregation exposed
only through the existing ACPI interface; the existing class devices
provide firmware-independent userspace access.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/profile/core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/profile/core.c b/drivers/platform/profile/core.c
index 57c3dad2732b..a850942131cd 100644
--- a/drivers/platform/profile/core.c
+++ b/drivers/platform/profile/core.c
@@ -256,6 +256,7 @@ static ssize_t profile_store(struct device *dev,
 		ret = _store_class_profile(dev, &index);
 		if (ret)
 			return ret;
+		_notify_class_profile(dev, NULL);
 	}
 
 	profile_notify();
@@ -330,7 +331,7 @@ static int _remove_hidden_choices(struct device *dev, void *arg)
 }
 
 /**
- * platform_profile_choices_show - Show the available profile choices for legacy sysfs interface
+ * platform_profile_choices_show - Show the aggregate profile choices
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to write to
@@ -366,7 +367,7 @@ static ssize_t platform_profile_choices_show(struct kobject *kobj,
 }
 
 /**
- * _aggregate_profiles - Aggregate the profiles for legacy sysfs interface
+ * _aggregate_profiles - Aggregate the profiles across providers
  * @dev: The device
  * @data: The profile to return
  *
@@ -391,7 +392,7 @@ static int _aggregate_profiles(struct device *dev, void *data)
 }
 
 /**
- * _store_and_notify - Store and notify a class from legacy sysfs interface
+ * _store_and_notify - Store and notify a provider from an aggregate write
  * @dev: The device
  * @data: The profile to return
  *
@@ -409,7 +410,7 @@ static int _store_and_notify(struct device *dev, void *data)
 }
 
 /**
- * platform_profile_show - Show the current profile for legacy sysfs interface
+ * platform_profile_show - Show the current aggregate profile
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to write to
@@ -437,7 +438,7 @@ static ssize_t platform_profile_show(struct kobject *kobj,
 }
 
 /**
- * platform_profile_store - Set the profile for legacy sysfs interface
+ * platform_profile_store - Set the profile across all providers
  * @kobj: The kobject
  * @attr: The attribute
  * @buf: The buffer to read from
@@ -508,7 +509,7 @@ static int profile_update(void)
 }
 
 /**
- * platform_profile_notify - Notify class device and legacy sysfs interface
+ * platform_profile_notify - Notify the provider and aggregate sysfs interfaces
  * @dev: The class device
  */
 void platform_profile_notify(struct device *dev)
@@ -650,6 +651,7 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 	scoped_guard(mutex, &profile_lock)
 		list_del(&to_pprof_handler(ppdev)->node);
 
+	profile_update();
 	device_unregister(ppdev);
 
 cleanup_ida:
-- 
2.43.0
