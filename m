Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04D38237E
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028289; cv=none; b=TB7vTdbZkj+ZOisi7jM1hhgHEsLG4OzhhGSetW6axWj58Fvqsw3NlmPMZ0LgccFHQ6ipQ6Y7X+V1nE0SxZJ0kqR5X5CwyNpQCLo/PfmRMh9zhFLYR6aAzJPadrDaCm/3nTiz9orEhZRrawU9XQbzdKHIdcg+fkFXCwGMErO//7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028289; c=relaxed/simple;
	bh=Pw+ssuLutbx3g6u/jM5PMxxasbxx9jVlsAJtmVGQOkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pjj14juXJiJm/CILFH3Z/YyzxG8fQVGE3h5V6wprUgmhc9MdVlpNNOre3h6RxyTY8QCcnZHm03HWPLAwTcDWbd+5jMC+s5lh28ayMzf3XrPuVMx3rsrDb6Fej+v4KL7bDkoV8pxQLygFFkw2wuYCJs2DVJTeBOvtU0pXF1DqJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHcdvFbo; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHcdvFbo"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1279eced0b9so5152500c88.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028287; x=1776633087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtTcFBJ7InscTxETiiZ7Szcd4eyMEX33KwP3VapF0JQ=;
        b=AHcdvFbop7/cmhffkByBAgOryuY1Vf03jk/LHnquOSl/+gs1Os2uWcVx67P4jO570N
         YL8Anzww5xo0cSZrhoHlx1sGJzvXeYp9oUgxrd8/QBp6kq/0DjcKGxl+3jSrVyWggdmp
         HiBkRzFVSmQ/ciZsJzjFTC7JAHp+kueUDX8Fyjyxy0AvuKg4XkC4HRh0J3Q9Hwo5lCj8
         XOZdPWSAO7m1929vOmvOQzn6w3FFmvmC+HME1wprwZcWCTE+mIialMFV5W1CIBv6VC94
         gezY3l2qPQPE7xNvM4vnS2YwHz5No76fIWXykPMM/1tfO4jjo/OL+xQcnR3pzRycFbUt
         CIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028287; x=1776633087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtTcFBJ7InscTxETiiZ7Szcd4eyMEX33KwP3VapF0JQ=;
        b=IzgvaSi8TUQmaKXQ4UdfoVDQUItspHEKQFLZfgJY6ugjGD3+uRvzQ3xVymGkxce6cN
         3o1XsKv8TIBYIWtuoMxZYxX1Ri2UyRDLTBg5e01wgt6WyP59fkfpcxNY+MZLvCOpw9cP
         occ6cLRyKR13eHDv5/BpOndsi/uwrxbV41soB7nD6Q0x+BXd7hqE3UPpGgMqFxY3Ii6r
         9oCfoKSwqAA4iguwScvsaagOwGmzgcKKL7r8fYQt1I5Z2j+zw/necy3opOfnUAZVF7x5
         oyMiXLC6iFMVUaCWIEBam4UsWMh9WF7WRcrP63iO7DzYTPxXjDJW1TaIdBIuIx1g/CLt
         cxSg==
X-Forwarded-Encrypted: i=1; AJvYcCU7PDp1vSIam6SXrwlYrOoitJZPF2KTP9HBqDyIen1q4WAq6NWuVoUJb/uW1Z3oWe0M457e8ZROh+Ww6rwT+mhMLsbG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrj1W+1a506UAvLfa2no28nxWjFc7jFmonsmzU0qTAN9CFrp51
	HjtI0WwlYi5MEsecCAO39MRgjN5U9D5/eoosqteArvLx2q4s7me22bn/
X-Gm-Gg: AeBDievkQSFH39BPoDVeNpa+0MznWzp750MKSbDgUJ7XlB/Zik84L4dCHYyKh0B/WuH
	D+IGjZv4sDKaCWJzvSfWfWSFpAtK8OF40XVV1TBNgIQtEf/krlRNXuXyEzanJUW5cCV5Xz6uWh4
	qXCxjt20x+zok4U/V7xH9M4feStuxqG+AK6Pm6jTNHyzKdFI4M//1z/+2PT3dTFUG2lwHXFP2iT
	++JUlHEyEOQ+IDu6sN2vM3j8LkrM1jNpgg1CwG8TSQFB3Ya2AJ8rXNOFlHGRQzxy3dJeTO2DvrW
	QcuH3YhZW4ZP0KHf7yCOHX3nQzvGquKJgiWmbzA4O13c/WOtBKxYc9jsHPhIqxXk8SMOzfM1swW
	h4MzUMkTZ3cfhMZgwC7qA/KtBfP3PkOEW990SlrHtKddss+CpPmjW+EYdude+DV8G0xV5nvJYHm
	wXWEnFWKbgkrStOOKr0X4fbRRPhR0Wv4VgKbNiiV0d7Stno6l5IgNJTkJem54WzM1/Ys4ats9cl
	P7g
X-Received: by 2002:a05:7022:250d:b0:11b:b3a1:714a with SMTP id a92af1059eb24-12c34e8f8a4mr6821180c88.12.1776028286579;
        Sun, 12 Apr 2026 14:11:26 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:26 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v10 04/16] platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
Date: Sun, 12 Apr 2026 14:11:09 -0700
Message-ID: <20260412211121.2220556-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds explicit initialization of wmi_method_args_32 declarations with
zero values to prevent uninitialized data from being sent to the device
BIOS when passed.

No functional change intended.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Reported-by: Rong Zhang <i@rong.moe>
Closes: https://lore.kernel.org/platform-driver-x86/95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe/
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v7:
  - Include lwmi_gz_profile_set() fix as well.
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 2 +-
 drivers/platform/x86/lenovo/wmi-other.c    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 381836d29a96..ca559e6c031d 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -203,7 +203,7 @@ static int lwmi_gz_profile_set(struct device *dev,
 			       enum platform_profile_option profile)
 {
 	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	int ret;
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index a6be3463341c..1e06b894cfcc 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -166,7 +166,7 @@ MODULE_PARM_DESC(relax_fan_constraint,
  */
 static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
 {
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	u32 method_id, retval;
 	int err;
 
@@ -773,7 +773,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 					struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
 	u32 attribute_id;
@@ -836,7 +836,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 				       struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	u32 attribute_id;
 	int retval;
-- 
2.53.0

