Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51693330675
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 01:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780449611; cv=none; b=JRjDtlRtnCSHyj8dvPoOz9CO/eEDO3ijmXXa0YnkHMOGSZL8xJqQxdhbDaWMQzhhU17V41K8FsrC2c8Y99MKnsuPfZEQcpoWgrcKASZzsSDsXaTzDBkiTUDeTSsH4tKedd4D0rDF5wbgDrQIBi7380BZUQwh+ZYRz+Y6DojQlg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780449611; c=relaxed/simple;
	bh=X2dEVd080G3tFtSLGg0TPfgttDaglj7OY7qYN8LWK1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Za3dYzp1suf8Vj10iXgrRyKDv2R4qqQka15fEhyDQ4/RbY3BP45lgv6nr/tUl5EknHet+NailfRCoPKPsU26ccmFnWuQ8tgCSgqWFgXU4Q3sVYu1yMqC/FjgO9+TPI37n/OI8oM4MSrReG3GYuxRQm/UiJdZ3GChMan8IRpACd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvXPIZMm; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvXPIZMm"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36d98b68d68so2136148a91.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jun 2026 18:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780449610; x=1781054410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCMJDiCIgzAtqnt6dz74YTjqS3h40asLQNcG80V0akc=;
        b=LvXPIZMmX0W+a7Rj6WAY7n68OHk+uuW8hnN6d68zRWOhCqybnAYOrzBEftRmDnlyKo
         /J3bsfmQV5gK07f0ObzwT+Rzh0hR5d1yZU/L45bzYQ4keUACsEp6pfJRIj5XE3M0qPB7
         1nCt2UtNa9dSo5JWR4jt7M4H1RGX+uGfDow+wECSIpCRkaFhZQa3YeE045nqwjvkdaCo
         IfMNx/wk8RFGZdBRNoooftx+Szq7QzXrEUZhOScMpqG/ezZPRF2qevU9IzABLFKkYsGC
         ZxYqu3/Nvy5uCVvnW7UB2FwjFyCuOiE7pa6yWlhu9N5VocO/SspoMUwfjVd1MqcGeK99
         JDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449610; x=1781054410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCMJDiCIgzAtqnt6dz74YTjqS3h40asLQNcG80V0akc=;
        b=I2WY8VHH+05lINvHhLOciJw5/VogB2cuSdDUu3602xZM/rPPFIVAomhJ4jwzuijrmE
         sL4nCswisZBtbresyslho3saLLkSXPK8Fo4E+Sm95+WD+CJLs7JvbNcLk1EUVNw4yRpm
         xfSyGkXmsrg8XF429I0G8k/DCoiiobXGbE4+pDXaUH49r0melMT2kGym5b/QDX17uTV6
         pJk5b349yZrwc9Y2hnioW+FbRsrsYtVJIwoa51hw0pYO38U4q309KEqSmFScHZ5eXOZr
         h+VYqdaQ9CZ6gD1ZnB7RmfsEdHUJZMOnHnJNXeoKEPRDR/qGDly1q5okVZRadvVlnbBp
         vdUA==
X-Gm-Message-State: AOJu0Yy96vR5ZvFmrLLJ3vI/E6VX4MdRM4XEv7cLkjWgc/c768DNWkSS
	GbRvSoqxnjum5nK2ZdjK/SEUImKtoB5rWcBaH4y/Vz/6CZ/styFbIKeD73JfjBD+P2E=
X-Gm-Gg: Acq92OE8YF6WDPlfOgYYYhdr9QypUIq8GF/cEWAMbGriA5mIr5oa18+85ke0RAEhrtd
	p6zb9V8WOVZo0VkThir06Hh2zmiwb59iPeM14MkhW7j4MQklxI91zeKVz7R41cwX1V6LKYTSJg7
	Aa87Jr0P50JwRtsL+yD5UcaiqeAkh5CKnSBL/73EA7VUhueiVaNTrgv4vguOy7Uz5CpzF5aTd5c
	9Si94gzVDvYFaNzyEILcPbLxr5TvAijm5fC9Qs9S2wUMwlzP1hQ4gTFXzA8CIfnNahGG1TZywml
	0lYrL+goT9IIayavp/0O4kNoXtxkTysKqZF2CvUR9xdt+MTYhi7ThJeNJqnnVG8DR4yzR7yjS56
	CM6xigqAeVVMktzRMiQQdVImkwq4Jpgpu3pgn+YfZW25jjZZrHGb19PnjxTPEZm5QgblLmvvR7x
	Y796Q2puXVi1/nCOun76bbbZNkAV1IzuxNFnXG27a9kPBTPy6BQVxInOnJKw0rEntE
X-Received: by 2002:a17:90b:4b8b:b0:36d:bbe0:de7c with SMTP id 98e67ed59e1d1-36e30f0fb4cmr1119150a91.12.1780449609593;
        Tue, 02 Jun 2026 18:20:09 -0700 (PDT)
Received: from localhost ([175.176.17.146])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c85df0341f6sm500364a12.7.2026.06.02.18.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:20:09 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: panasonic-laptop: add fan speed mode for newer models
Date: Wed,  3 Jun 2026 09:19:33 +0800
Message-ID: <20260603011934.43467-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have a CF-SR4 and Linux works out of the box. Compared to
previous models, this one seems to have the fans running at high speed
by default when the computer starts.

When Windows 11 is booted up, the high fan speeds persist just until the
login screen. Once the login screen shows up, the fan spins down.

I had suspected that this might be the laptop ramping down the fans when
the OS declares that it is Windows but this does not seem to be the
case.

After analyzing the DSDT and SSDT of the computer, I have found the
following:

File ssdt10.dsl under \_SB.PC00.LPCB.EC0:

Name (CEFM, Zero)
Method (SEFM, 1, Serialized)
{
    CEFM = Arg0
    REFM ()
}

Method (REFM, 0, Serialized)
{
    If ((\S0IX == 0x03))
    {
        Local0 = 0x05
    }
    ElseIf ((CEFM == Zero))
    {
        Local0 = Zero
    }
    Else
    {
        Local0 = 0x02
    }

    \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, Local0, Zero)
}

\_SB.PC00.LPCB.EC0.CEFM would seem be the current value
for the fan profile. On startup, this is set to 0.

Based on the code SEFM seems the be the method to set the fan
profile and REFM is executed right after.

I don't have access to information as to what the argument officially
means but based on testing, any number above zero makes the fans spin
down and behave like the older models where it stops or runs at low
speed when its cool and ramps up when the processor gets hot.

The only relevant values for CEFM seem to be just 0 and any number above
that just gets treated the same. I personally use just 0 and 1.
0 seems to be the high fan speed mode and 1 makes it behave like
Windows.

Giving 0 as an argument reverts the fan back to the way it was during
startup where the lowest fan speed is quite high and when load is
applied, it seems to ramp up to an even higher speed which I think would
be its 100%.

A value of 1 seems to have its max speed capped lower than 0.

For both modes, fan management is still automatic.

fan_mode only shows up in sysfs only if \_SB.PC00.LPCB.EC0.CEFM and
\_SB.PC00.LPCB.EC0.SEFM are both present which should mean it should not
show up on unsupported models. I have tried not hiding it and it just
outputs a generic error when the value is read.

I also saw that variables such as eco_mode are kept in memory, however
for fan_mode I rely on getting and setting the value via ACPI.

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 98 +++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index b83113c26f88..3a8bbd633fd1 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -507,6 +507,76 @@ static int set_optd_power_state(int new_state)
 	return result;
 }
 
+/* on newer models (ex: CF-SR4), fan mode can be set */
+/* check if this is available */
+
+static acpi_status check_fan_mode_present(void)
+{
+	acpi_status status = AE_OK;
+	acpi_handle handle;
+
+	/* check if read and set are available */
+	/* read fan speed profile */
+	status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
+	if (ACPI_FAILURE(status))
+		goto out;
+	/* set fan speed profile */
+	status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
+	if (ACPI_FAILURE(status))
+		goto out;
+
+out:
+	return status;
+}
+
+/* get fan mode state */
+
+static int get_fan_mode_state(void)
+{
+	acpi_status status;
+	unsigned long long state;
+
+	/* bios default is zero which seems to be some sort of performance mode */
+	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL, &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("evaluation error _SB.PC00.LPCB.EC0.CEFM\n");
+		state = -EIO;
+	}
+	int result = (int)state;
+	return result;
+}
+
+/* set fan mode */
+
+static int set_fan_mode_state(int new_state)
+{
+	int result;
+	acpi_status status;
+
+	result = get_fan_mode_state();
+	if (result < 0)
+		goto out;
+	if (new_state == result)
+		goto out;
+
+	union acpi_object param[1];
+	struct acpi_object_list input;
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = new_state;
+	input.count = 1; /* takes one arg */
+	input.pointer = param;
+
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.SEFM",
+			&input, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("_SB.PC00.LPCB.EC0.SEFM evaluation failed\n");
+		return -EINVAL;
+	}
+out:
+	return result;
+}
+
 
 /* sysfs user interface functions */
 
@@ -778,6 +848,29 @@ static ssize_t cdpower_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t fan_mode_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	int state = get_fan_mode_state();
+
+	if (state < 0)
+		return state;
+
+	return sysfs_emit(buf, "%d\n", state);
+}
+
+static ssize_t fan_mode_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	int err, val;
+
+	err = kstrtoint(buf, 10, &val);
+	if (err)
+		return err;
+	set_fan_mode_state(val);
+	return count;
+}
+
 static DEVICE_ATTR_RO(numbatt);
 static DEVICE_ATTR_RO(lcdtype);
 static DEVICE_ATTR_RW(mute);
@@ -787,6 +880,7 @@ static DEVICE_ATTR_RW(ac_brightness);
 static DEVICE_ATTR_RW(dc_brightness);
 static DEVICE_ATTR_RW(current_brightness);
 static DEVICE_ATTR_RW(cdpower);
+static DEVICE_ATTR_RW(fan_mode);
 
 static umode_t pcc_sysfs_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
 {
@@ -803,6 +897,9 @@ static umode_t pcc_sysfs_is_visible(struct kobject *kobj, struct attribute *attr
 	if (attr == &dev_attr_current_brightness.attr)
 		return (pcc->num_sifr > SINF_CUR_BRIGHT) ? attr->mode : 0;
 
+	if (attr == &dev_attr_fan_mode.attr) /* mostly present on newer models */
+		return (ACPI_SUCCESS(check_fan_mode_present())) ? attr->mode : 0;
+
 	return attr->mode;
 }
 
@@ -816,6 +913,7 @@ static struct attribute *pcc_sysfs_entries[] = {
 	&dev_attr_dc_brightness.attr,
 	&dev_attr_current_brightness.attr,
 	&dev_attr_cdpower.attr,
+	&dev_attr_fan_mode.attr,
 	NULL,
 };
 
-- 
2.54.0

