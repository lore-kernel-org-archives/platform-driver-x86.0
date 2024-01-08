Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADE53FE4E
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 12:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SLRAwH6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704716713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AwkYiwQF4NLGVI26IY7VJOS6s7uygalTNZSWBH0exq0=;
	b=SLRAwH6wRB4WMHjtpRap7Ut88+UJHKBYwf7c/ZwX+x8lJNtjx0+AI18VC6h1xhhLM9jfgJ
	U9DyRO+wJ+fBQ5TFPKTvVW1jJB4xA81n3EqJY/3XbZCxEXneTbkHxKecG/NYr1sBWNxULT
	R/ArD2bDqzSCRVUg2Fx8eVUA+poMrnQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-9zP8vEV6MC6j7YA-D-X6-g-1; Mon, 08 Jan 2024 07:25:12 -0500
X-MC-Unique: 9zP8vEV6MC6j7YA-D-X6-g-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d50e74183fso3917845ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jan 2024 04:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704716711; x=1705321511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwkYiwQF4NLGVI26IY7VJOS6s7uygalTNZSWBH0exq0=;
        b=BXVSE12oTYJCZyugj5RH0EauK7i25/yth7GLw9Guv0pCN7+rfYIeQ3RsQ0gmMZUWuO
         n2C3c3A5pR03/EsghcoLf+HgQkvjEocyxalxY5ATgMWlVlXHilkXgLnVziKlKlBswd7R
         XdP8NZWb3wmIrif21TffY9N+NdRmCGKqQ8PlUdxfHwUEoJuwcS3eY2+NzLZBoCi0FMst
         SLbIS8po/3rx+N/58hPZ3G8YH053I9QoyPT6b4dI+QHyFnhmuY5S8++P4KBi6SjSvizp
         NgTbDYT68VbqNZtXL1W4bYLgFg8g4e+qmNqvqrE1qA8QwfFNSRzPXDiAq6T+ZTZae9wL
         Sl7w==
X-Gm-Message-State: AOJu0YzLcnNiYyh96urMUMWehDJbDV2cxma5ZIMPorspfSkj0k8SXBKr
	JQY+RAWjpL7tT0rDhTFF2tJHkuTaMYR8LkaK7635NYcEQ5wYkIBEhoaMxsdx84D1Z81heW1+Gk7
	IB64I8kfTbQCLcuwToWjLbxt6EARzvw+sN8GlgcsUFg==
X-Received: by 2002:a17:902:ea0c:b0:1d4:3af0:8650 with SMTP id s12-20020a170902ea0c00b001d43af08650mr1497306plg.38.1704716710967;
        Mon, 08 Jan 2024 04:25:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvzxV85vIB81C2jjjnPxMWzTmbseXUnjn17ijpGDbMbPWTCc3JmwlE5yXQbImC8MpugFJbJA==
X-Received: by 2002:a17:902:ea0c:b0:1d4:3af0:8650 with SMTP id s12-20020a170902ea0c00b001d43af08650mr1497285plg.38.1704716710570;
        Mon, 08 Jan 2024 04:25:10 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d50400b001d46a313b51sm6134035plg.72.2024.01.08.04.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 04:25:09 -0800 (PST)
Message-ID: <d7342193-cd48-42d4-8967-52e3a1bf8d84@redhat.com>
Date: Mon, 8 Jan 2024 13:25:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] platform/x86: pmc_atom: Check state of PMC managed
 devices on s2idle
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>,
 Andy Shevchenko <andy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, platform-driver-x86@vger.kernel.org,
 x86@kernel.org, linux-clk@vger.kernel.org
References: <20240107140310.46512-1-hdegoede@redhat.com>
 <20240107140310.46512-4-hdegoede@redhat.com>
 <a4d814a2-66bd-6429-539c-196fabbf48ae@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a4d814a2-66bd-6429-539c-196fabbf48ae@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 1/8/24 12:18, Ilpo Järvinen wrote:
> On Sun, 7 Jan 2024, Hans de Goede wrote:
> 
>> From: Johannes Stezenbach <js@sig21.net>
>>
>> This is a port of "pm: Add pm suspend debug notifier for South IPs"
>> from the latte-l-oss branch of:
>> from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss
> 
> If this is to be included at all, don't place it first but last in the 
> commit message. That is, focus on the change itself, not where the patch 
> came from.
> 
>> With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
>> functionality this can now finally be ported to the mainline kernel
> 
> What is "this" (and no, don't point it to some external patch in some 
> random branch).
> 
>> without requiring adding non-upstreamable hooks into the cpu_idle
>> driver mechanism.
> 
> Somehow this entire paragraph (and the one preceeding it) has a flawed way 
> to look things, it focuses on stuff that seems largely irrelevant. 
> Instead, there should be "a problem statement", what is problem this patch 
> is addressing / why.

You are right this really belongs in the cover-letter which already
has it. I have pretty much entirely rewritten the commit message
for the upcoming v3 of this.

Regards,

Hans



> 
>> This adds a check that all hardware blocks in the South complex
>> (controlled by PMC) are in a state that allows the SoC to enter S0i3
>> and prints an error message for any device in D0.
>>
>> Note the pmc_atom code is enabled by CONFIG_X86_INTEL_LPSS which
>> already depends on ACPI.
>>
>> Signed-off-by: Johannes Stezenbach <js@sig21.net>
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> [hdegoede: Use acpi_s2idle_dev_ops, ignore fused off blocks, PMIC I2C]
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Drop duplicated "pmc_atom: " prefix from pr_err() / pr_dbg() messages
>> ---
>>  drivers/platform/x86/pmc_atom.c | 67 +++++++++++++++++++++++++++++++++
>>  1 file changed, 67 insertions(+)
>>
>> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
>> index 93a6414c6611..81ad66117365 100644
>> --- a/drivers/platform/x86/pmc_atom.c
>> +++ b/drivers/platform/x86/pmc_atom.c
>> @@ -6,6 +6,7 @@
>>  
>>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>  
>> +#include <linux/acpi.h>
>>  #include <linux/debugfs.h>
>>  #include <linux/device.h>
>>  #include <linux/dmi.h>
>> @@ -17,6 +18,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/pci.h>
>>  #include <linux/seq_file.h>
>> +#include <linux/suspend.h>
>>  
>>  struct pmc_bit_map {
>>  	const char *name;
>> @@ -448,6 +450,67 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
>>  	return 0;
>>  }
>>  
>> +#ifdef CONFIG_SUSPEND
>> +static void pmc_dev_state_check(u32 sts, const struct pmc_bit_map *sts_map,
>> +				u32 fd, const struct pmc_bit_map *fd_map,
>> +				u32 sts_possible_false_pos)
>> +{
>> +	int index;
>> +
>> +	for (index = 0; sts_map[index].name; index++) {
>> +		if (!(fd_map[index].bit_mask & fd) &&
>> +		    !(sts_map[index].bit_mask & sts)) {
>> +			if (sts_map[index].bit_mask & sts_possible_false_pos)
>> +				pm_pr_dbg("%s is in D0 prior to s2idle\n",
>> +					  sts_map[index].name);
>> +			else
>> +				pr_err("%s is in D0 prior to s2idle\n",
>> +				       sts_map[index].name);
>> +		}
>> +	}
>> +}
>> +
>> +static void pmc_s2idle_check(void)
>> +{
>> +	struct pmc_dev *pmc = &pmc_device;
>> +	const struct pmc_reg_map *m = pmc->map;
>> +	u32 func_dis, func_dis_2;
>> +	u32 d3_sts_0, d3_sts_1;
>> +	u32 false_pos_sts_0, false_pos_sts_1;
>> +
>> +	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
>> +	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
>> +	d3_sts_0 = pmc_reg_read(pmc, PMC_D3_STS_0);
>> +	d3_sts_1 = pmc_reg_read(pmc, PMC_D3_STS_1);
>> +
>> +	/*
>> +	 * Some blocks are not used on lower-featured versions of the SoC and
>> +	 * always report D0, add these to false_pos mask to log at debug level.
> 
> Please explain this also in the commit message.
> 
>> +	 */
>> +	if (m->d3_sts_1	== byt_d3_sts_1_map) {
>> +		/* BYT */
> 
> Can these be written open into the longer form.
> 
>> +		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_PCIE_PORT0 |
>> +			BIT_PCIE_PORT1 | BIT_PCIE_PORT2 | BIT_PCIE_PORT3 |
>> +			BIT_LPSS2_F5_I2C5;
>> +		false_pos_sts_1 = BIT_SMB | BIT_USH_SS_PHY | BIT_DFX;
>> +	} else {
>> +		/* CHT */
>> +		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_LPSS2_F7_I2C7;
>> +		false_pos_sts_1 = BIT_SMB | BIT_STS_ISH;
>> +	}
> 
> Perhaps move common bits out of the if blocks?
> 
>> +
>> +	/* Low part */
>> +	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
>> +
>> +	/* High part */
>> +	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
> 
> The variables are called _0 and _1 but the comment talks about "low" and 
> "high", could these be made consistent such that variabless end into _lo & 
> _hi ?
> 
> After making that change, I don't think those comments add any value any 
> further value to what is already plainly visible from the code itself.

Ack, I'll replace the _0 and _1 with _lo and _hi.

Regards,

Hans



> 
>> +}
>> +
>> +static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
>> +	.check = pmc_s2idle_check,
>> +};
>> +#endif
>> +
>>  static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  {
>>  	struct pmc_dev *pmc = &pmc_device;
>> @@ -485,6 +548,10 @@ static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		dev_warn(&pdev->dev, "platform clocks register failed: %d\n",
>>  			 ret);
>>  
>> +#ifdef CONFIG_SUSPEND
>> +	acpi_register_lps0_dev(&pmc_s2idle_ops);
>> +#endif
>> +
>>  	pmc->init = true;
>>  	return ret;
>>  }
>>
> 

