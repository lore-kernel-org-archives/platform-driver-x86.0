Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B223D7D64
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534464; cv=none; b=EUPyKLI4+RjKZvkDK8MSkmux0iKD9BOdPFARp+H3qlDw4xofaqOM822TK6D7ayeOAGiA/TckrptMzQV52OzwW7L7xmOzn7413JauG3M80zjNiz55b89YT4tQk9g3sOR7OG37hF5B2TkAbnN0nc3tE4lD9KGknouGxhYtdkjfP0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534464; c=relaxed/simple;
	bh=0isVpghelXoSKwPd5BDTOfUOhe8G+mSFyfnWyqokP+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXOSs8v9EVcw0xbhaVOgRBZ/hPuziB1/Gcc64pMJQqMdB82fzojWX1pAgRJoADLu/Am3BkJ1Nvb1hTEIvGVYDzWdkkNH7WvhkLweoxzxSCNjZgBFvy34WUODNO4tiw71/5JB8tmFL1BB8A4p9UqrWHmIw3phMdz4QzxkXWO9ESM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3yCv+eO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+pJ/Zj0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3yCv+eO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+pJ/Zj0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TNuQkv3636737
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 07:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=; b=Q3yCv+eOgXQ6X9GR
	HugoST/ZYazdpYD04NUoQfKTPUUUkr+bviWG894/1rte7U6CCzEsLSKw3u0fixOZ
	Mqc+GfJzjuqLjeTcsSH9K3CkkdBO1et1je2keJEH9RHpJkLVXmbI7jZdL4TwPhTe
	eU+LLvI5V5kukD+yX1NVQewxDj+BQns2jvR8XckgbGXpzoZcAZXzQw3PIB26lbDw
	Nig/WDbQbohnZLBi/wsPrf2HuH9i2SHYgKh2kg1ydmu+Pv+3Eu9Sp1uM+VS9cCzi
	b5+z1kE6DDrHbpE6FbHWe5y5ONfXO17QZX4UBdhTM7/SBOvifI7mkDEJBA62xd40
	0dOcXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duv3q1d7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 07:34:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso1556541cf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534456; x=1778139256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=;
        b=b+pJ/Zj07iy1ppcZcOAlk40Hl2RqGKfsUIMIi2VQXFMe3TwN7ZFAfBogWIhx2Ez6hn
         qRv2htKbt4qrna9oBRTBMJFVLS2ZkoVLks6fkw5S+kEp0WDpLRPyuHZ2epr/AJ6yXyMx
         140HneYsX8A+ybIUB33et2wENa4JCP94EndslGFqDOQpqY6w217JZqAKbjYkTk3K6PrR
         XyBzf+gS0B9My82Fuf8ko7qrA6iBXjejKkRyj47JHp8qNV04WcuGhKJTp2GxCWyPus7R
         hmb+KLLCeKaMJ46sSUImzfAE196m0cTvZsGaRfWZ5RSk0P8JSHGX6CYUSY1po92pv5DN
         e/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534456; x=1778139256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+SWNLR9PCkztSIAkA+PWHwuqxCpfkGWdZHp+l4RUhvE=;
        b=aBaG0CpcFGPEej+byDhZAVXqqm77fefncaqS8slb3Q76wpm4XK+HHHB2DpEqBDrq5R
         2LeInESxXwjnMnIsO1kVUuVrdVUk+gWi9CxnkKzO2WPTkwM1G52+r2EdZ2j8oUjoYVNA
         07yRz/T6TwNs7Bqhba5yE+10lg1jN4wvX6mNDoP10fPdWcF5ZeDzbVUd5gbd6s1tFHaA
         OO2hnrgx/b9WNHVtuZ7GkXNPkvtT4XzFHYCvX23SdZo/7/wTAVj350AWkskdjIwTNgdE
         RZvIEYgoZp2s1YfWPK/nf5tTe008aqHn2gU74PCxYQs+HOpraoPRGUWIWCbx5IRham3M
         drMw==
X-Forwarded-Encrypted: i=1; AFNElJ9gk2JNC21FVV+B2Gw6wMMpyu+oeVqUGgbFjDkaJkpQr5ehnEtGw7rcJmq2nqA+NSwLvpX66ZoA2EVEiv0j5bugsaEl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6PsjAAQUYI6H4SqpRVsPKHfoA6QDRLEX6mdytRv8LWKDtgpLf
	omXGhe7/TeikvTI6fvDqGVF+QW9NehJuJ4N4bT0PLpIgXRPwcgXLOioLvQG5NjXg5I7tlfgq+sX
	YySHaV3bgnbFsQiyuZSCUNSAXqRNLpaT/5w2muIMTfasEaMO3s/JpcC1vfIeJfVvYeqIN26LwO7
	uX
X-Gm-Gg: AeBDievO0SVaPLhzNWKEV3avd/P1QSJreDZ/4QwsuATwIkb48oJIW5SmroaGdh3kOVS
	yslJaWEKyavZ0iMfZuv26ysxVSR/IA3nOgrKpJTEjEbVEZKM5M/qG0kEb96d9UmWdwQEVn8DBGk
	BtexSuwUBf6h+EGyLj2ol7f7A7I4iVQIheAS3NBPtAz3l/Xnz46XoiQpDG0vEO+6unA4EyYZK1E
	PS6RWNw7yOGbjkiQYgB0EigIpNCInuO5NgYmj5qvU6MZwF7FHNXu/eTjs0fOeiDPPh0PQBD5GyG
	MiAAexQoZLDEMnAZBUYaqxnNVfC4UfDxLK7SaMwVtsHYgbuqER0dDuetb6SDFbCmiqEg1d7eTzZ
	YoC0jWq0LyDudtExxwvwpUHodvEs9fBYaJBW5VrUMv7yNUz5qTBQbC0LJzJS4
X-Received: by 2002:ac8:7d87:0:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-5102aaebd3fmr22953931cf.1.1777534455729;
        Thu, 30 Apr 2026 00:34:15 -0700 (PDT)
X-Received: by 2002:ac8:7d87:0:b0:50d:9b4a:e6f with SMTP id d75a77b69052e-5102aaebd3fmr22953561cf.1.1777534455111;
        Thu, 30 Apr 2026 00:34:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm76132625e9.2.2026.04.30.00.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:34:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:34:05 +0200
Subject: [PATCH v4 1/2] ACPI: provide acpi_bus_find_device_by_name()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-baytrail-real-swnode-v4-1-767bcda6667f@oss.qualcomm.com>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
In-Reply-To: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0isVpghelXoSKwPd5BDTOfUOhe8G+mSFyfnWyqokP+g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wXxZC+mASP2ppNNMW84j+0XxHWW5nI+GRHzG
 tayHaJ0nXqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMF8QAKCRAFnS7L/zaE
 w8dgEACegJw/nKBn+I0OhND1U3+dBoBHnWiTymvDzlqlzPb8Kqo6c/IazxlfmWakeZi6zVfDURg
 j/0slWcp1WjemC8d5k/wLUlm9a485s+uTHg/bCwtmYkyjbwem1uUtqttqq/q/0YH0A95OXrU9I/
 FLMBxbaUleTzwkszDnqDBvwIMHNn10SwZ4X/qk6iR84oXEo2moYEFECFlkljqfwQNu0H9/o5dVK
 XuGoydEaaKrCF4mjQl+MpBY3OwK4cUsqZA/WoqJB5oR/6bqBPX68UiDBLgFxBvbKi/Rt0w3m3wU
 HbK2hc3Ll5MGRnrQmdbgo2t3jfEju1a41cHic6lAXdVD2zNThthh+Swleir8MLduY7XqETGRdc/
 0XbWPfROHaZU+no7NRmhZmZk5ZhvnNj+HKKMsNJH9r0sVybVTLgRhVXfi+FDQAlpbGRNIpDHR2r
 aYayi6IzNR+QmpuP9hVwpH8dwKzesqggOIChdJlWufiEGUgGv3N4Fim1RfzgqXnsMFlCF1mA2k+
 a4pe7kb9CuPYtwlwVtpsXpyUNmMxBVISt+v42bTwJ/ixvHQa5bh37O04OzvUGoADJBfEPs+clCt
 pwT3ZDhtN4EDdXp+q5JO0rAfMFARf73MtQbXpt9P+VeSAuZXYhNb1n161BgMBv/ay8KDXP78imI
 RUvXZ6T5ahpsVHQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: AYErmZwdmz5bWQ5iphZFPKNZSq7DrDr8
X-Authority-Analysis: v=2.4 cv=dOyWXuZb c=1 sm=1 tr=0 ts=69f305f8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=B8ktV2ObmFyAxeXX9HEA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX1+4KqwEEfD0q
 ENaZXr0YK9yOfvEYofwU0ZlVE/zkJlaDj1jDU20ZMduyfj6+qa4X8tI/6xwjrOdszG959sTk2/i
 I4bP0jaXKA5QSWOmlYHdEoOFO65q9mzFE9U3Md0J6Dn/FRL29XAaZQyHAJP/xwNtxJBLxGx7ysi
 DNmvrFUgr98sNlYpa1SPNw3PDSi5Aau8XygZUqyhsFW780uNv9vAPp715jQCQG21gw96BHF0suW
 VQLyXbHdBIFvavoIUyuOZcCKwHv71NE711dWTsxKBIuH4PnLCKjxfFbGXhKuK//KEa4CjAQfUcp
 fPHKVp2yEIoqdI+WHGMlweQ0qlQR+tWH7iA4SziPpgmSP0MX4KpGtYLKPkA9JkitAKhIslPw/33
 5VYBLKTN8o5RxGjjy21GwoOTlTTHROPHDgiW0MtpkjvEWozr2DDBDdKW/ngX/qCBwVzt48gMW57
 ImIznWQjZBZVhzTPTqA==
X-Proofpoint-ORIG-GUID: AYErmZwdmz5bWQ5iphZFPKNZSq7DrDr8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300072

Provide a helper allowing to locate an ACPI device by its name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/bus.c   | 13 +++++++++++++
 include/linux/acpi.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e40b0645f654fb051429e5679dc7c..5dd8459be03db4165bcb59943b94ea7db273ad7b 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1181,6 +1181,19 @@ int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data)
 }
 EXPORT_SYMBOL_GPL(acpi_bus_for_each_dev);
 
+/**
+ * acpi_bus_find_device_by_name() - Locate an ACPI device by its name
+ * @name: Name of the device to match
+ *
+ * Returns:
+ * New reference to the matched device or NULL if the device can't be found.
+ */
+struct device *acpi_bus_find_device_by_name(const char *name)
+{
+	return bus_find_device_by_name(&acpi_bus_type, NULL, name);
+}
+EXPORT_SYMBOL_GPL(acpi_bus_find_device_by_name);
+
 struct acpi_dev_walk_context {
 	int (*fn)(struct acpi_device *, void *);
 	void *data;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 67effb91fa98373d7bf19be5ae3d8baa9328d6e1..10d6c6c11bdffcad14100601e104520366dfc30b 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -798,6 +798,8 @@ int acpi_get_local_u64_address(acpi_handle handle, u64 *addr);
 int acpi_get_local_address(acpi_handle handle, u32 *addr);
 const char *acpi_get_subsystem_id(acpi_handle handle);
 
+struct device *acpi_bus_find_device_by_name(const char *name);
+
 #ifdef CONFIG_ACPI_MRRM
 int acpi_mrrm_max_mem_region(void);
 #endif
@@ -1106,6 +1108,11 @@ static inline const char *acpi_get_subsystem_id(acpi_handle handle)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct device *acpi_bus_find_device_by_name(const char *name)
+{
+	return NULL;
+}
+
 static inline int acpi_register_wakeup_handler(int wake_irq,
 	bool (*wakeup)(void *context), void *context)
 {

-- 
2.47.3

