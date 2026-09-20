Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC93D333E
	for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 05:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789882867; cv=none; b=k7haFMvUaexPlhskF+30oWhQwuTGY8qc+c8qR1lhcTnHFXt7Ev+pyiEaj+H0q3MykZuZ5g6aLX0qKxDtLkfz9MIT8+G29OYSyX20uZIQlogtV66wx/AbNX9r7JZp1YuygwfC0JiLeYK1nYy8JXraxPazCSfpC1pthNnpcSbJC2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789882867; c=relaxed/simple;
	bh=S4rw3VO027Kvsf8AWU8mIIRtjc2chY1FoYSwHGt4da0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tWEtqRuYTW+E0ZjpcfmA2rUmWdj5UCBNzqhUIioOuES95tfTqhCrbmheIjL0W/SNFeYjLUms3T6XDDjQoTeCT+pNEMc79qwBzEpP8wnNYYnhJQfLUNtzQ+GsUHUehVdStbSgNovXA3tMsE7rlVn3WdbUTFoPI53zaOfM8SKMvIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpVWw1XN; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpVWw1XN"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb76bcb1fso22114931cf.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 22:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789882864; x=1790487664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8Vc5MX+B0em8pc0SW0hGSwKyC2SgQeynJxbpmv5R8k=;
        b=qpVWw1XNl4BceCSXqCrphPHreCRcf7K3EaGjyyThah089WOCwfr87zGhYipAvzR3X+
         wOMGPiQhfWRaGoHg5qJdXYpoL4ocZg3bRxUry3ypDLYv2pR47BL11ecmouspcPWbKn2J
         X9d3QwuxEOZf+eWhbkXmTXFd8lbiCVpRpG900Cthk5TljBFlolX/p3BqCrDHSM/VkrSO
         dRtR40U4o5Nw0MvDmcTJ7KawBtniT6sFDUh6cdDPBLcf+9Es6/QYqgFsPPP6r6ioiLbV
         SLfvKtvEDvPZOn3JrWLQmsaoYPrsokOZbbzNykyomVF57PYzBt36tTIwCRqhd7z1fEhW
         isHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789882864; x=1790487664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8Vc5MX+B0em8pc0SW0hGSwKyC2SgQeynJxbpmv5R8k=;
        b=pIZ6WmMcuEf0BWi8z7Ipgr/ZhvN9FBxE3z52sQMo3bw36kjzhqW3OO1Rt/8WkYq/wt
         HmW+Zb2Bt10saibBgfQI6o7XPtnPw5V32oEP/jD3HOH7pavn/AWqAeuYSmYtjly5Y4RZ
         ndI7sY3F/i89uk8fVFiAASFx+IXhFiG3QA4Io7H8cWR1HF59FUr63U1Xy0xF75mxufb4
         THknoJus10QwtJd2g+yflNZj7fDWs3RBnDn9l1nt9XT02cLMdI9vcBlBZ/GQnIp89qIp
         AMjrzQyCZhlXu4AWxBzr1Kv4zqycolGdxVL5wqRY85ddje28VRVvEvdntBtOZLCz3wPK
         3Pyg==
X-Forwarded-Encrypted: i=1; AKwUvBzEETN2oq9BYXGwPCo7d7ju2PHuYAygxjixaCqESluLIudzSqUEapG3GZmGMpwhAPi2XXge27dOXGixq+Qlb6SbDKoH@vger.kernel.org
X-Gm-Message-State: AFuF++l3PPLywO9YWIDR6dDz055fnu3BBV9/Zw6Xo+VVsfdrpk/cBvwU
	dodRHGZiZFl9dSgAR7rKJK32Opzv6vu/4fuPYLGLAgmOhpzipjFwcvc=
X-Gm-Gg: AYBFou32B8Dtzxyhl+b1SJgPPCIG9n90Z0FTLCtc0fYBAhcj++uxc5/mjWcbtA6VeRl
	ySOdEXL5v7xngnbEAuAUfrE7HkXmg+EI5LckizUV1rccSALRIJH2MkvpG8G7ZyGto8gElNsSH0g
	zMP2CmhuJYWqCjIgq/IemdrKiIitBOoRuSVK9ki2bGLIBBQVp5wNDPrZPjQCZ0xbal6nMKi3OIQ
	RKOdYATa8AycxYA3H3j9Rnoyqhb3CAMunl2qmSVdyodrlUDPbTM4uaImJ3nIEIh3UQpnzMANj+2
	FMr3Iw7X8xzd5sc0IY5MaqYgx+v4Ax4VxLvSpddnQU08ETAIgQzlPVoFe9YXrTGNeAFf5DoPF/6
	Sy69uFaAvETPr9A8F/OmuiMSVuGP7cke6AoHQgflD5nl2ixcxfs+ovY+F7f8vDDR8Mkv63QOnwm
	7re2uk14ifzoci46dBP2V5ICUR+ZvqSMl0ZUboJVQbPH74fyshSyZgdBGBzVViJWXAspKvlgXfs
	gMYHmiF6TSSNC50DdbN2J8EmsXEXmVpEPWyBzyS2TISEC19QKwdwKnHdOh0EjLjBZAyoSu/b/cI
	Yvm66P3Ks6vZhbLV86ZlP030+hSwJGMdmQ3MBSJSZovAaLzE
X-Received: by 2002:a05:622a:2516:b0:530:3855:e8cf with SMTP id d75a77b69052e-532b71bec22mr43372671cf.1.1789882864383;
        Sat, 19 Sep 2026 22:41:04 -0700 (PDT)
Received: from localhost.localdomain (ool-18ba9fde.dyn.optonline.net. [24.186.159.222])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae72cafcsm34715841cf.18.2026.09.19.22.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 22:41:04 -0700 (PDT)
From: Justin Vargas <justinyvar@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Vargas <justinyvar@gmail.com>
Subject: [PATCH v4] platform/x86: acer-wmi: Add support for Acer Nitro ANV15-51
Date: Sun, 20 Sep 2026 01:39:18 -0400
Message-ID: <20260920053918.1888-1-justinyvar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729222920.6490-1-justinyvar@gmail.com>
References: <20260729222920.6490-1-justinyvar@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for thermal
profile handling, hardware monitoring and fan control, but has no quirk
entry, so none of these features are available.

Add a quirk entry for this model.

Note that this machine does not support the turbo thermal profile:
writing PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware with
-EIO. The four remaining profiles work as expected.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Justin Vargas <justinyvar@gmail.com>
Tested-by: Justin Vargas <justinyvar@gmail.com>
---
v4: Rebased onto review-ilpo-next as requested. The quirk now sets
    .hwmon and .platform_profile separately following 4bee415640e
    ("platform/x86: acer-wmi: split hwmon from platform profile quirk"),
    and uses bool values following 93f8ae8a26b ("platform/x86: acer-wmi:
    use bool for boolean quirk fields"). Dropped the reference to the
    supported profiles bitmap from the commit message, since b0908e03fdd4
    ("platform/x86: acer-wmi: Stop using ACPI bitmap for platform profile
    choices") stopped trusting it; the turbo claim now rests only on the
    firmware rejecting the write. Retested on the new base.
v3: Use a model-specific quirk_entry with cpu_fans, gpu_fans and pwm
    set, as suggested by Armin Wolf, instead of reusing
    quirk_acer_predator_v4. Fan control tested.
v2: Add Assisted-by trailer per
    Documentation/process/coding-assistants.rst.

Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026), by building
this patch as an out-of-tree acer-wmi module against kernel
7.2.6-1-cachyos and loading it on the machine. No module parameter was
needed - the DMI quirk matches on its own.

Thermal profiles:

  $ cat /sys/firmware/acpi/platform_profile_choices
  low-power quiet balanced balanced-performance performance

  low-power, quiet, balanced and balanced-performance all apply
  successfully. Writing performance fails with -EIO.

hwmon and fan control, via the acer hwmon device:

  pwm1_enable  pwm1   fan1 (CPU)  fan2 (GPU)
  2 (auto)     229    2501 RPM    2286 RPM
  1 (manual)   255    8136 RPM    2303 RPM
  1 (manual)   128    4464 RPM    2293 RPM

  Driving pwm2 to 255 raised fan2 to 7309 RPM while fan1 was unaffected,
  so the two fans are independently controllable. Restoring
  pwm1_enable/pwm2_enable to 2 returned both fans to automatic control.

  temp1_input, temp2_input and temp3_input are also exposed.

  Note: .cpu_fans and .gpu_fans are set here following
  quirk_acer_predator_ph16_72, and this is the configuration that was
  tested. If you would prefer them dropped, as in
  quirk_acer_nitro_an515_58, I am happy to send a v5.

The analysis and patch were produced with AI assistance (see the
Assisted-by trailer); all testing was performed by me on the physical
machine, and I take responsibility for the patch as signed off above.

 drivers/platform/x86/acer-wmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index d3d741aad55..51b2ae9e57a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -474,6 +474,14 @@ static struct quirk_entry quirk_acer_predator_ph315_53 = {
 	.gpu_fans = 1,
 };
 
+static struct quirk_entry quirk_acer_nitro_anv15_51 = {
+	.cpu_fans = 1,
+	.gpu_fans = 1,
+	.hwmon = true,
+	.platform_profile = true,
+	.pwm = true,
+};
+
 static struct quirk_entry quirk_acer_predator_ph16_72 = {
 	.turbo = true,
 	.cpu_fans = 1,
@@ -682,6 +690,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_nitro_an515_58,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro ANV15-51",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
+		},
+		.driver_data = &quirk_acer_nitro_anv15_51,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",

base-commit: f475845eaf3d749114a63270bf2efea459e14dd2
-- 
2.47.3

