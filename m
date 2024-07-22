Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739333CD1
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721637430; cv=none; b=X9BYDunRjWmL8Ob8M5MuwYNLfO7pqqzTDxH7KD+98TlCPAX6SjgTcTeSRI9ejIoNTF5KC3ek2WARRL+sQ9S5lxQ75sL/4K9rTQAabm7zltmIB6ssiTmupBcu7YQsKur7r1Ad7qjbihaP/SO6ODybmf4yve/8ZwamCtQts+Tj9Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721637430; c=relaxed/simple;
	bh=46kRvm6OFMQTyQNXg8QchgNBwqh7VFWCZdHe/zf1KFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/Yv8mW4tmaDTybWrqG3e3nwv2Ij/591HdhcfXRVwQisakLXx70pXUKJvEpFJ4pz5g2STn/Ojm+KQUs8BGnvnrXPWkgvHaeAnNjLj6NqJy2Pij4Wec8ITdiKHTIcFBzNr8dYWbrOTRpG93biMSMi2e/zXjjsczdtSZgICvYkCZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=TOFIjQtk; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="TOFIjQtk"
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DEB373F2B8
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721637425;
	bh=HpNZIN5xTexJ1U8TLubq24eNb4tcjfL0OXQsYeqcBOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=TOFIjQtkRgdilZRxI/n/VvsSUghFlW3Hjl40mSEI8sHuWeJMEaIul3CQ7TavfLEY/
	 ++cNTfms9tuGqvAulgquyfnSsTx2o/rvMnSPp5rwn2+5xFTxzXGgzP0BavfZQXvDY4
	 u4unkxxwVQ1BwUx1MgsSjFGNUHjxfnItrTi5DZJNE5pWnzpmpTGjS3SVVh2pm7pSta
	 rqaCsCs+STDcU4B19PgmKaxN+HPvFjy6xSiYL1WlfAGjPji1wQkgDDbrVn28STglDG
	 EG1on8XB8WcF8o6jGgmnIX7+IRMo9lTyNW6tzJFFX7RqbzqJeM8oQ3IRhQDjL5F102
	 RGYxOfcdqmnng==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1fc6f3ac7beso25225995ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jul 2024 01:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721637424; x=1722242224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpNZIN5xTexJ1U8TLubq24eNb4tcjfL0OXQsYeqcBOg=;
        b=uNNfCRP4HdXEOrWmBmhCQkd9tqocxlStv0NtPcMxvVo+MbVBkwSapZQmt9aXVZnmhh
         dIojcMWYdluZ8FmyZWSZpa1eSLc6cKhePLHH46Er1BPw7tFoFeIniVH7xsugEVcK2RPn
         w3qvrFMF9h4TNyHNNn3UeZlcft66PqjXyKsBMxUxGxbuVv6qnfjdVRa2c7gYmjeDyHQb
         lmqrT4ZqOuHMBXTf2as8pW4zYBxDUXVUMT7xTMVr0UVoeOEgrYAvUXdiH+CyuX2Al1g9
         AeGi8W5rlRtYMPtuEJmhFuNfyDP38Rf1jjUsQPEAbYLonUZeljBdyjYi4T5nR0wVQjr0
         43jg==
X-Forwarded-Encrypted: i=1; AJvYcCUY8gYa0S+iUla9ZsEaO7VSpDqSgZFTFwA5eW+PwgQbrYfvuvD8GLFLOGPAQlTi+HACa5CGUgWN/A0ECLlBdrrfZ+ZyXHtgCTTyCCANwW4bY3CIpg==
X-Gm-Message-State: AOJu0YxePeDNsH57JUNy65yB2x7CYza+P5bmVaHwn3wtf/2K/LHdE8br
	JByFR9hPR1qKGFuUozfkyITWU59EElxPuKmhYXF22u4yeLWecqLvA5roRVexh4yTyv2+RsvZhE2
	5dXrZ26CsVTnn5R16WrbJk2DtcBy4VVenFnXl3M7V+/8qLblsriRVPEtdJJe8m1YwdH85Q0Bkjb
	nB/3L1YXKglbY=
X-Received: by 2002:a17:902:d492:b0:1fb:a1cb:cb31 with SMTP id d9443c01a7336-1fd7454f2eamr45863045ad.17.1721637424377;
        Mon, 22 Jul 2024 01:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvUsZL/+q6ITqJCqx0MJ/oH9erXZnWjJN6OZgEq136r3jlAkhnKbuP1XiFvE3Oa7UD9sMpKw==
X-Received: by 2002:a17:902:d492:b0:1fb:a1cb:cb31 with SMTP id d9443c01a7336-1fd7454f2eamr45862825ad.17.1721637423916;
        Mon, 22 Jul 2024 01:37:03 -0700 (PDT)
Received: from rickywu0421-ThinkPad-X1-Carbon-Gen-11.. ([122.147.171.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31f625sm49271785ad.161.2024.07.22.01.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 01:37:03 -0700 (PDT)
From: En-Wei Wu <en-wei.wu@canonical.com>
To: acelan.kao@canonical.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: en-wei.wu@canonical.com,
	Kostadin Stoilov <kmstoilov@gmail.com>
Subject: [PATCH] platform/x86: intel-vbtn: Support for tablet mode on Dell Venue 11 Pro 7140
Date: Mon, 22 Jul 2024 16:36:58 +0800
Message-ID: <20240722083658.54518-1-en-wei.wu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a Dell Venue 7140 tablet with the keyboard/touchpad/battery dock, when
disconnecting the dock there is a kernel bug:

BUG: kernel NULL pointer dereference, address: 0000000000000018

And this causes the following things not to work:
1. Suspend to idle - the system simply hangs
2. Poweroff normally (the only way is forcing it via long press the power button)
3. USB ports: both the USB port on the tablet and also plugging in the keyboard again

The error message above (plus some crash dump) isn't so useful for debugging, but we
have noticed that there is a debug message shown before the crash dump:

intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving
a switch event

The messages above is shown right after the dock is disconnected, and the message implies:

We failed to set the priv->has_switches to true in the probe function since the
Dell Venue 11 Pro 7140 is not shown in the dmi_switches_allow_list, and this causes a problem
that no input_register_device() on the switch device is called. Afterward, When a user
disconnects the dock, intel-vbtn receives the ACPI event and finally find that there is a
switch out there. So intel-vbtn starts to register the switch device, which may be a dangerous
behavior since there might be some device-related objects/structs that has been freed (due to
the disconnection of the dock).

To solve this problem from the root cause, simply add the Dell Venue 11 pro 7140 to the
dmi_switches_allow_list.
(The Dell Venue 11 Pro 7140 is a 2-in-1 model that has chassis-type "Portable".)

BugLink: https://bugs.launchpad.net/bugs/2073001

Fixes: 8169bd3e6e19 ("platform/x86: intel-vbtn: Switch to an allow-list
for SW_TABLET_MODE reporting")
Reported-by: Kostadin Stoilov <kmstoilov@gmail.com>
Tested-by: Kostadin Stoilov <kmstoilov@gmail.com>
Signed-off-by: En-Wei Wu <en-wei.wu@canonical.com>
---
 drivers/platform/x86/intel/vbtn.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 9b7ce03ba085..46d07d3cd34b 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -235,6 +235,12 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Venue 11 Pro 7130"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Venue 11 Pro 7140"),
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-- 
2.43.0

