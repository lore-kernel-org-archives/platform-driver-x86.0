Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EB52BE034
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 03:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781061494; cv=none; b=bBhN3D4fQfi/SBKYc3fCrcwD/yWi9xt5TCB0a36IBoNAydmKSwLH/yvYzFfEJF1vH2QpDYeF3K+7dCtj6ywkv3OEGendBSH1J1CAqP1pHuo3x8IJx6jdNvxkN+wJ7VpY6IBY2ycZlEhaNIqV7pcHfa4PUOF2fqPvKc/IZPVQnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781061494; c=relaxed/simple;
	bh=NG24U6/5jrStgO2L4zMqEzbYcc1cwAg97rtD1lY3cqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9xYGRS7WovBuGBRjxkZ9w8ubgsjNno34DGpLq/9U+xVUFS2dVXPggcVs7Z0HD9vihNpXwC7r6c0tImFsyb4DR+s4CxqLk8p/jzIwJcY0siucg2bXnsWwmKHlrBsABvLNy0OLZ5NjakWBcNJmiRjV+fdZs6fsCDzkz6xVF3c0kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGVSc22H; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGVSc22H"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8424b6792efso2286443b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Jun 2026 20:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781061491; x=1781666291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVaER5sIXqhj/hybfyD6aUknKi/3+lFXTVdwDopBgB0=;
        b=FGVSc22HONVjDHgwqK6d+QN62pmMCyMrw233wKWpiN7jI7J1L5SppXjwNEQAjbkzlj
         UZx83FO4mKI34y24HbyVdmYmGGoZ5f00ikdksOvhcH3C57onZXLHtNEyCjI440zSImCD
         HDJlpFzyAhN9L8XwwTrLWb8gP4qwWyQ+dPqSLTBE+tJ0jHRQQy2rrjXWq9a9aES93duc
         6ovpx0uiuQlBns7E3kOrDbcSsRgRnv8YGnuos+RKK1kyP0f3eegmCPQhhvD6Exgh9WdH
         nbJeMrt4MVoSBkbCCwCgi8mUx0tbdjDUBQ0tJtSOaxC4RfTKmUS52JVqlS5bVwUYt/Sj
         I+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781061491; x=1781666291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVaER5sIXqhj/hybfyD6aUknKi/3+lFXTVdwDopBgB0=;
        b=jbHQQajlZvnZyg0yfMux/TOsvcsFATxG3dIwfTuJIUjhZmlRqzRfU1SLtTUlKnPSYj
         hVwz1Bm9dYwW1LpyskPjVVAFUwivWFlPWk/bfRT8TW91J6Oc83g9PUCHGLSwexwRbNqM
         8zySEREokM/MoY4iPHCB/K2rZFJK60d1yCWZD7DrPZyfSeqd1gt6GG/eovIqWT1NBvvx
         A2iaBp6fVmMCJ35/vzmarVNCgNyxcsZefSasUaALc6nrb2gvPPgPKNw9MQvjZ8/RWyTQ
         9PBhuN56Xi7BEYKWxLH8UNMxIhi5oYQua7qutsWYHKFTdyDUh+2loj0u4yKH+CRglDfs
         2/aw==
X-Gm-Message-State: AOJu0Yw2+pcr3Aq8xK1QaVAjE3ueCNyHR9yyQyjuDwIY+oT8MUGq1W+B
	Q7OzP+kUZI+ivVXWKKXfdfxGsa7sfJ7l1HmUycjjQxdHvcuhMCeBHaAVGzYAdqhOxSo=
X-Gm-Gg: Acq92OHEnL6FkjGYeUcvR9ZmnS3PGle+51fOVyEclQAcgXY05OQf1thsCX29DDBa4EO
	3SWiKF1uYrDZ+xIz63ow2sMMZCq3TzkgxAhTcob4MZYQ5QNxUUqtCKjKL/M/UfIEnIGOn2yuxYW
	OW6cCO1fLmxewFLnJ7gaROO0sPSldnxGnsiXtO1ye324jdgzkWEmtk9+gp+wJBB9U4us7snwS5t
	T9z+NWUPA9wCMQNa/NFaj5we6YQxPo0XzlOgdiWAmX3tQLeYJ62EaXVQqswgInM+EhpgbKvAF8j
	D0OdFk9/P96wAPS0Kpm25SmJ7VOq9zLo61MzFLPMNCH8yXMt75fs7vg1ZyUjP0dB6jIdUH3kMhG
	cEVkzp4NPKlpdHwrnEGkjrjxVlYPuMxww48qZP+Dgs6+3ItHvwzQNmnRa9uvwn+2TheHiWpxLWn
	pKbvZcsNV2e7RY9mqtmPJEqIfNuAGONNvJJy1zM82uA7JXY77lz/AZiY9U6yR0erabNg==
X-Received: by 2002:a05:6a00:114e:b0:83a:7565:3505 with SMTP id d2e1a72fcca58-842b0e12e57mr23778850b3a.8.1781061491065;
        Tue, 09 Jun 2026 20:18:11 -0700 (PDT)
Received: from localhost ([112.204.126.243])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm28281391b3a.44.2026.06.09.20.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:18:10 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2] platform/x86: panasonic-laptop: add fan speed mode for newer models
Date: Wed, 10 Jun 2026 11:17:54 +0800
Message-ID: <20260610031756.546459-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <bc272424-9ec6-8f3b-19c1-89fded10e230@linux.intel.com>
References: <bc272424-9ec6-8f3b-19c1-89fded10e230@linux.intel.com>
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
Thank you for taking the time to read the patch and give feedback.

I have revised the patch according to the comments.

However, for some parts I would like to clarify the following:

>Include for pr_err() is missing it seems.
>This file seems to be lacking sysfs.h, please add the include now.

For both pr_err() and sysfs.h they should be included as both are
referenced/used multiple times within the same file.

>kstrtouint()?

It takes in input via sysfs
something like:
$ echo 1 | sudo tee "/sys/devices/LNXSYSTM:00/LNXSYBUS:00/MAT0019:00/fan_mode"
and based on the other functions within the same file, the input
is expected to be a string which is converted into an int via kstrtouint()
as CEFM is an int

>But I'm unsure whether sysfs is right place for this interface. acer-wmi
>driver seems to have fan mode auto/turbo selection using hwmon interface
>but this driver doesn't have hwmon as is...

I do get what you mean. My personal goal is to have this work smoothly
with software like thermald as the vendor appears to use Intel Dynamic
Tuning Technology with non-standard ACPI methods to control the fan.
I will take a look into that and see if exposing the control via a
different way works better.

To summarize, it appears the OS calls SEFM to let the EC know the OS
has taken control of the fan. The fan then spins down until
it stops completely (level 0). This then allows the OS to set
the fan level from 0 to 100. If the processor gets too hot,
the EC intervenes and ramps up the fan.
From what I can gather, when running Windows, the vendor's driver
together with Intel DTT work together to control the fan.

Given this, I would like to ask what is the most appropriate
place in the kernel to expose this functionality?
I understand that hwmon was mentioned but I also see that
interacting with /sys/class/thermal may also be an option.

Thank you for your time.

 drivers/platform/x86/panasonic-laptop.c | 99 +++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index b83113c26f88..b05f11c223f9 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -507,6 +507,72 @@ static int set_optd_power_state(int new_state)
 	return result;
 }
 
+/* on newer models (ex: CF-SR4), fan mode can be set */
+/* check if this is available */
+
+static acpi_status check_fan_mode_present(void)
+{
+	acpi_handle handle;
+
+	/* check if read (CEFM) and set (SEFM) are available */
+	status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", &handle);
+	if (ACPI_FAILURE(status))
+		return -ENOENT;
+	status = acpi_get_handle(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &handle);
+	if (ACPI_FAILURE(status))
+		return -ENOENT;
+
+	return 0;
+}
+
+/* get fan mode state */
+
+static int get_fan_mode_state(void)
+{
+	unsigned long long state;
+	acpi_status status;
+
+	/* BIOS default is zero which seems to be some sort of performance mode */
+	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL, &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("evaluation error _SB.PC00.LPCB.EC0.CEFM\n");
+		return -EIO;
+	}
+
+	return (int)state;
+}
+
+/* set fan mode */
+
+static int set_fan_mode_state(int new_state)
+{
+	acpi_status status;
+	int result;
+
+	result = get_fan_mode_state();
+	if (result < 0)
+		return result;
+	if (new_state == result)
+		return result;
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
+				      &input, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Setting of fan mode via _SB.PC00.LPCB.EC0.SEFM evaluation failed. You may have an unsupported model.\n");
+		return -EINVAL;
+	}
+
+	return result;
+}
+
 
 /* sysfs user interface functions */
 
@@ -778,6 +844,34 @@ static ssize_t cdpower_store(struct device *dev, struct device_attribute *attr,
 	return count;
 }
 
+static ssize_t fan_mode_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	int state;
+
+	state = get_fan_mode_state();
+	if (state < 0)
+		return state;
+
+	return sysfs_emit(buf, "%d\n", state);
+}
+
+static ssize_t fan_mode_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	int status;
+	int err;
+	int val;
+
+	err = kstrtoint(buf, 10, &val);
+	if (err)
+		return err;
+
+	status = set_fan_mode_state(val);
+
+	return status;
+}
+
 static DEVICE_ATTR_RO(numbatt);
 static DEVICE_ATTR_RO(lcdtype);
 static DEVICE_ATTR_RW(mute);
@@ -787,6 +881,7 @@ static DEVICE_ATTR_RW(ac_brightness);
 static DEVICE_ATTR_RW(dc_brightness);
 static DEVICE_ATTR_RW(current_brightness);
 static DEVICE_ATTR_RW(cdpower);
+static DEVICE_ATTR_RW(fan_mode);
 
 static umode_t pcc_sysfs_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
 {
@@ -803,6 +898,9 @@ static umode_t pcc_sysfs_is_visible(struct kobject *kobj, struct attribute *attr
 	if (attr == &dev_attr_current_brightness.attr)
 		return (pcc->num_sifr > SINF_CUR_BRIGHT) ? attr->mode : 0;
 
+	if (attr == &dev_attr_fan_mode.attr) /* mostly present on newer models */
+		return (ACPI_SUCCESS(check_fan_mode_present())) ? attr->mode : 0;
+
 	return attr->mode;
 }
 
@@ -816,6 +914,7 @@ static struct attribute *pcc_sysfs_entries[] = {
 	&dev_attr_dc_brightness.attr,
 	&dev_attr_current_brightness.attr,
 	&dev_attr_cdpower.attr,
+	&dev_attr_fan_mode.attr,
 	NULL,
 };
 
-- 
2.54.0

