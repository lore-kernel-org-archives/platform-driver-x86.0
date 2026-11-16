Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844367;
	b=WZ1MnYycoOWfzlVTqItqPA50u/6hyn6jnzlCgzUX7KdMITFUTkXwvbXSvcZdP0K5gfsT
	 JTsk7JlIQnhPG7HUUsuBHi4DrLb1NV+Ee1MKmnuE9Bt8RAHVbpRfcJp4aWmAbb5PnT5j/
	 Q7DTx0osCvQsmP5DnkrTrLWJyGwKN8lakrS1P+fFXAj8nI6YxL8QfpQIo7n2ziJ4TUc8N
	 MOyD/RAE08PpRjROT1Z6Y+F1WcraTklUhILVNuXPGV6mBl5G3wsW5LMuy9y5Ihk452ULV
	 r7w1PoXYrHTjsHWZT/12d7AwinPWje0LEEaS6xFASaB8gfsoaA0ScF418FtCZkUpA5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f09LbFbzsrP+5JEKU6LsA1tqG6izYEkt3fstb0HirUw=;
	b=ya2IEhfiFaZ1g2W4XRE/eBhCdjmpXsLURQbvSbU5pduUfet7FPRDVGwbhYtlS+A8GEli
	 EUxqlj3BUcitHFLwKpdDi9efYTUJ/MqrbuDpAdEXjfGvqVXuJgMZSS3ye/OcawltsVX3N
	 Z6QkT+oycurbFrSZ8QiDFoSA16Xq92mgpMTSLZXQsS+2MDN05PaohqgiVIdUoChhQpSp8
	 TFc0UHr/x7EpBPxNjh8+lLwrK0QuNj9FgzKe6lka+gRKPU6YzprZYeRqmODQk2Zh7NpN4
	 FlzcRhuply60yBHOJRoN4zd7RGzcYZAfytUCEgWG8qBUsLQywfcK8cQ9fPlhdI4oZBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNcsmVze;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7F606A882
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C7F606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oNcsmVze
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-491aaed7565so1711519f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 07:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844366; x=1795449166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f09LbFbzsrP+5JEKU6LsA1tqG6izYEkt3fstb0HirUw=;
        b=oNcsmVzeYE7WPt+i300Bb/xG/YCYgIbXz1N9KfmiGgj6pexjhk9cxnRBOoYpA22Oxm
         ovQfoWyNHXpHWZ6OoTmOuYUxZBLtIE+PbC/KzOOqzQVWYuboRV1at0V8t27bj5isYtY5
         1A9F2SrbMZyPNrF0R34fmWWEYSUVF7IXBoRbiY6DArpHWd2z+M1+ddaeGxpF8Y4T0bXC
         TX2uXvAEx9PDlAmNxdSEZ1e9gnx82GGC0SMPeZOg26I8b8CW9J72fAkk2Qtl2mNPBfkB
         7zlSIUN8Rw1JOU/Xyk5O8mhHJkP8MhByxX4l7ObQH8VPs0B9WkLNHvHsmiHL1nyDnb4f
         cHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844366; x=1795449166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f09LbFbzsrP+5JEKU6LsA1tqG6izYEkt3fstb0HirUw=;
        b=jAPZ4tZ8Yy5MZVU7ETzZNXR8KJJE6ckrS1mY/C56e+qSXehXBqeR5MeclxLDxHxHuJ
         4E2vaODoonJjOa8koLvXF/CsY9v6e6lZzRCZGyuT6m2owYzfE2Q6j7atWDlQ0SSqYYef
         sHPcGaA5dMnKFLPadZDKw3KvDW2elKwJegbjXWnLIq0OTPbNJdOYvp50US7dgLNwwK5n
         LtwALvAtY9i2lM+bv7Fq50XOtkjJlHpx7pF5hmbHPisqJQDb/c74iht7fXAHrBz8gouT
         nvxYa43nA+b27c0RW5XrOVLJLsWeX+Sh1yQQESmn1/a+XsceYkvDw/CedpJ+1ik19/pO
         5vQQ==
X-Forwarded-Encrypted: i=1; AL+hErEe+18UTOf7JnJJ8js9PDJ/ZTVs+PZri1idV2cxIz7gveh9/50SD5IarqPHb2zDnxGthUTp/vSIh8fm11y4ypAzrI4D@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZRcvqK3yWom5rJavdc09ToZ5FDvdyWE0of3RmCjzBwbzE0zYr
	RL24JAh2NrnMpDEmQVChm4ufZBpg73LLZqAYWlESjOS3mf6qfqmxcADZ
X-Gm-Gg: AYBFou09LthdzzIe6RDpgfu3RDkgZZlim3i6kbjwgyVRQPeA1IqVMqEy+28RWJvSKB9
	ftTEIptQ+k4Wc0zEFhi9pptF8ZtsqeGmIgnj8dbopUTO1DB3Gjz5elFw58FQQtV8dmgp7QOCT1O
	qvDnAy744NAYsCsSaGf6gD7YD++Vs19LI5Cb9t4WO/HfuCwsn1JjZRr9Yz2v3vwlMb5CdOahoiT
	JXLr9tmVNoRKX7zvJB3DLuXMsHa3H0BorKGooGuXhxUJyj5kUudY2xHwhND+RzsjpVjTyk9m2B9
	qw2Ax/BG9ZyhUTSsXheKMaLK1y4SHZvy6LbBaoTGspu1+CT9Q3A4IsNPJTcOUxg7QInUaNe5G2k
	oaZsLqPdpLzCBtXdHiEvypMPyg4S9MA03IIyAPwVhs0ArVJMH+VYi3YxntKo+NU32smeuyK+KQ1
	mUYXs4xqQ23xAi9DKcqNXK9xj9y4Y4ln3zwAtqbYdwjRhmzqwuX5RLdPmeaJvRTzrCgfkwLJznU
	izO9sdbh8pKyUGRS8yDRyBjdH3iHp4UY3UQYR0Vi9JLkWF2w3hv7BzwVBqn2r60yztYIaAcGgI5
	Crk31LGSEMjQg5d93fTDDE5Fc8bF/Db1H6/TBaBZhjhWGT8BmNnNxx0BSTbcTWcG6IRC1a72Bh6
	eUsHRl0FZr0U3xJfOKkCahtH/1gBcCDZQBfQCygMd5Ic+craEgrVMa9KUx3lHHw==
X-Received: by 2002:a05:600c:3f0d:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb7757ff82mr18309875e9.19.1794844365564;
        Mon, 16 Nov 2026 07:52:45 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm321279415e9.10.2026.11.16.07.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:52:43 -0800 (PST)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>,
	Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: [PATCH v2 4/5] platform/x86/amd/hsmp: Add pwr_current_active_freq_limit_source_raw
Date: Mon, 16 Nov 2026 16:51:46 +0100
Message-ID: <20261116155147.769630-5-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116155147.769630-1-erwanaliasr1@gmail.com>
References: <20261116155147.769630-1-erwanaliasr1@gmail.com>
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

From: Erwan Velu <e.velu@criteo.com>

pwr_current_active_freq_limit_source reports the active frequency limit
sources as a list of names, one per line, which metrics exporters have
to parse and map back to a value.

Add pwr_current_active_freq_limit_source_raw, reporting the same source
bitmask as a single hexadecimal value. Exporters only need a plain
integer conversion, and its interpretation can be centralized in the
monitoring stack, e.g. with Grafana value mappings, instead of being
decoded on each server.

The bit assignment is defined by the HSMP specification and is stable:
new limit sources are only appended, existing bits never change meaning.
A given value therefore has a single interpretation, whatever the
platform or kernel version it comes from.

Assisted-by: claude-opus-5-5
Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>
Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  4 ++++
 drivers/platform/x86/amd/hsmp/sysfs.c | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index c4459a9dddc6..6156d50362cf 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -121,6 +121,10 @@ Following sysfs files are available at /sys/class/amd_hsmp/socket%d/.
   in MHz.
 * pwr_current_active_freq_limit_source: Source of current active frequency
   limit.
+* pwr_current_active_freq_limit_source_raw: Source of current active
+  frequency limit, as a hexadecimal bitmask. Bits 0 to 7 are, in order:
+  cHTC-Active, PROCHOT, TDC limit, PPT Limit, OPN Max, Reliability Limit,
+  APML Agent, HSMP Agent.
 
 ACPI device object format
 =========================
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index 94670c8e689b..5615b0385477 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -282,6 +282,21 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
 	return len;
 }
 
+static ssize_t hsmp_freq_limit_source_raw_show(struct device *dev,
+					       struct device_attribute *attr, char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	u32 data;
+	int ret;
+
+	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "0x%04lx\n", FIELD_GET(FREQ_SRC_IND_MASK, data));
+}
+
 static const struct bin_attribute  hsmp_metric_tbl_attr = {
 	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
 	.read = hsmp_metric_tbl_acpi_read,
@@ -315,6 +330,8 @@ HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_show, 0444);
 HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
 	      hsmp_freq_limit_source_show, 0444);
+HSMP_DEV_ATTR(pwr_current_active_freq_limit_source_raw, HSMP_GET_SOCKET_FREQ_LIMIT,
+	      hsmp_freq_limit_source_raw_show, 0444);
 
 static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_c0_residency_input.dattr.attr,
@@ -331,6 +348,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_clk_fmin.dattr.attr,
 	&hattr_pwr_current_active_freq_limit.dattr.attr,
 	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
+	&hattr_pwr_current_active_freq_limit_source_raw.dattr.attr,
 	NULL
 };
 
-- 
2.53.0

