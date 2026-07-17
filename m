Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1D397699;
	Fri, 17 Jul 2026 13:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294603; cv=none; b=KVnyUIYUqMcMFDctY5g1yWV42wdHhtxDopjDUxvW3EhoibsyzctE1VFSt9jHvKZfM2UGLOgWkrwTJm49Y6G9h5dyAFOj9Anb+GL1NEI/lE+L/Y9MGFZOogmbdQVbh1YA+gBE70Htc6AFxprYqswoJfLJf0FDSpoo8ER0JaNXnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294603; c=relaxed/simple;
	bh=yzoy6hQI/FsL0RzOSfZ+C3Cz+YduJhDP2tlFksTUKlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kILCUxJT24mriyv7/q3Bvir6HgeKx9/62mlYMYJBcJYWVLBpc/SfBt5XGbj6KDBG6ID7aWYSoCvwe61VrpBM9uTc+G7kyujinfYBtSiSZX/YY365E5lMYIefcNvPFoSH4CFLPCS+AafGGDmfAhtBcgg6VWqtJYIdSlB59c0MYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwIIAPrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwIIAPrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B84D1F000E9;
	Fri, 17 Jul 2026 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784294601;
	bh=mNW7VntiWekaW5oql9S7lBzDxUZRUyoxI3S8RPzXRLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FwIIAPrQVfqEja7Phq+naJfjrJWI8VVMFaXyy9ol2l2yqu1PeDG9Zc0QsQjtq5XpJ
	 zOZnqV3BoEoGs6b62Nech9Nhxe2CXUlNWeIMH+hvS8c9o4ryBdEzJXFxah6v99n9M5
	 BwYiUY/hUTaYVzYb+gEhtTh6A2v+t4fn2dBWhloCH8YN8hLmC6HrD33wvoUWWpc0jT
	 RrlxB8FYxczG96Xm3ReuhsyAEBDYfoaG4H3Nb5B1NVhz/KqM0vAU7guD1yr0wABu1o
	 wAieJ1XVI/xkLr7BXbHIEZdM+04BpcRWxmITz7iULXiJdRR/3C8D6T+W54fJIBio/H
	 NUtdlDl1b1JtA==
Message-ID: <02b400ad-4c36-4421-b09b-25eda35a311e@kernel.org>
Date: Fri, 17 Jul 2026 08:23:20 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Add T14 Gen2 AMD (20XL) to s2idle
 quirk list
Content-Language: en-US
To: Yap Weei Choong <ywc8891@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 Shyam-sundar.S-k@amd.com, linux-kernel@vger.kernel.org
References: <20260717060744.1252065-2-ywc8891@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260717060744.1252065-2-ywc8891@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/17/26 01:07, Yap Weei Choong wrote:
> The ThinkPad T14 Gen 2 AMD was sold under two machine types, 20XK and
> 20XL, but only 20XK has been in the s2idle quirk list since the quirk
> was introduced in commit 455cd867b85b ("platform/x86: thinkpad_acpi:
> Add a s2idle resume quirk for a number of laptops").
> 
> On 20XL machines the firmware SMI handler therefore still runs on the
> NVMe D3->D0 transition when exiting suspend-to-idle. With IOMMU
> translation enabled (the default), this intermittently stalls resume
> for ~10.25 seconds: seven devices across three root ports (nvme, both
> xhci_hcd functions, xhci-pci-renesas, snd_hda_intel x2, snd_rn_pci_acp3x)
> block in pci_pm_resume_noirq and are released simultaneously, consistent
> with all cores being held in SMM.
> 
> Add the missing 20XL machine type, mirroring the existing 20XK entry.
> This is the same class of omission fixed by commit 9a469c6dfab3
> ("platform/x86: thinkpad_acpi: Add missing T14s Gen1 type to s2idle
> quirk list").
> 
> Verified on a ThinkPad T14 Gen 2a (type 20XLS41C00, BIOS R1MET62W 1.32,
> kernel 6.12.95): with this entry the quirk message appears at probe and
> a 14-hour suspend resumes in ~1s with no noirq stalls, where previously
> even short suspends could hit the ~10s delay. A further two-day soak
> (short naps and two ~14-hour suspends) showed every resume clean.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221755
> Signed-off-by: Yap Weei Choong <ywc8891@gmail.com>
> Tested-by: Yap Weei Choong <ywc8891@gmail.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index 74ddf1d82..09a30f333 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -71,6 +71,14 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "20XK"),
>   		}
>   	},
> +	{
> +		.ident = "T14 Gen2 AMD",
> +		.driver_data = &quirk_s2idle_spurious_8042,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "20XL"),
> +		}
> +	},
>   	{
>   		.ident = "T14 Gen1 AMD",
>   		.driver_data = &quirk_s2idle_spurious_8042,

