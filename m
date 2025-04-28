Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF477E792
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880114; cv=none; b=rOewE/TR7wDG1vnTSKzJHDH2hKyjKXAxLpksFwSMJEX+5KDUJ7sNUwvM1GYJqxVboxmicocLvzmt71e3qZ6W3zjURG4kNjEQ8DHpdRZjn0IvENClhlB6vJZaFT+mtOBZ8QEHATp7GTPn0Ie50qu9fJJappkpooyTFKcR9TbKxjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880114; c=relaxed/simple;
	bh=Qj/Az1v7xWRdNZxY7oQodmk7f+8g8x1k0lPFILvPjDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mPDeyThU5EhJns0+QIlkMq0IyGMcpoIG5XIV3aOSBCUfm7VgqjGmHbEmWEjvJajcI1SmuZEpIXpbWczBzd57dUj3ruS22WwwDFGejUdvjkTCoxBPrB1cuG6FehiTEJb3rpa1CQmck57kdC2bdNMrbUZ0WqtSkoLDm+sn45rYXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzgKH/US; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzgKH/US"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369ABC4CEE4;
	Mon, 28 Apr 2025 22:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880114;
	bh=Qj/Az1v7xWRdNZxY7oQodmk7f+8g8x1k0lPFILvPjDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FzgKH/US6sYuPM3aj6yISbDueSlL429/v0mA2DfhpH7LAE3F/ZWJY0wLe/Mpfy+pl
	 xIj8UIePrqnhPNprrefzUZRzPxImofWX20kGHhZ5SYw294723r9+L8RY2sZOpuRhsz
	 laaYtg2NCuBukRu23p/WAo7c/D9QIAmWARntkPJ3xyD0ezB0REEWTsLFry5nhwcp+v
	 Cn3nFIHWmU6Lwezv9NzT5DlKa7F68QQ5a8cAOKhKrtDs2sbZaDoaVwjgqH/ENZQ/bX
	 Fii9V1xXwTrCAVUnvUsEDDBXNoiz24aOsI8XlFSK/A834+76BkZHLp2Vniav4bHEQD
	 unp2hzWlpQzvg==
Message-ID: <1a7ebbbb-f1c5-4233-b0e7-b3aca8b9bc69@kernel.org>
Date: Mon, 28 Apr 2025 17:41:52 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drivers/platform/x86/amd: pmf: Update screen lock
 actions to KEY_SCREENSAVER
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, Patil.Reddy@amd.com,
 Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <20250428200456.4094500-1-superm1@kernel.org>
 <ycqzbmktzlbxzcfktuoqvswtrlkpbx6yi6hcej5z4zcmausb22@3xqydbuueu57>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <ycqzbmktzlbxzcfktuoqvswtrlkpbx6yi6hcej5z4zcmausb22@3xqydbuueu57>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/2025 5:05 PM, Dmitry Torokhov wrote:
> Hi Mario,
> 
> On Mon, Apr 28, 2025 at 03:03:57PM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Screen lock actions are ignored by popular desktop environments currently.
>> This is because `KEY_SCREENLOCK` is not one of the legacy keys that popular
>> desktop environments listen to by default, `KEY_SCREENSAVER` is.
>>
>> Adjust the PMF driver to use the correct keycode.
>>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Cc: Armin Wolf <W_Armin@gmx.de>
>> Fixes: 4c92d448e3e61 ("platform/x86/amd/pmf: Use existing input event codes to update system states")
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v5:
>>   * As Dmitry pointed out that GNOME listens to multiple keys even if not advertised
>>     it meant there was a bug either in GNOME or the PMF driver.  Turns out it's in the PMF driver!
>>     Switch key combinations instead of using META+L
> 
> No, KEY_SCREENLOCK is the proper keycode, as you can infer from multiple
> instances of it in the kernel sources and only single KEY_SCREENSAVER in
> the code for an infrared remote controller.
> 
> X for ages mapped keycode 160 (152 KEY_SCREENSAVER/KEY_COFFEE + 8
> evdev offset compared to legacy XKB numbering) to COFFEE aka
> XF86ScreenSaver, and I still see it mapped on my system(s):
> 
> KeyRelease event, serial 42, synthetic NO, window 0x5200001,
>      root 0x4f4, subw 0x0, time 491884600, (89,58), root:(1920,1044),
>      state 0x0, keycode 160 (keysym 0x1008ff2d, XF86ScreenSaver), same_screen YES,
>      XLookupString gives 0 bytes:
>      XFilterEvent returns: False
> 
> And I also see it working in both KDE X11 and KDE Wayland. So again, it
> is either Gnome breakage or something wrong with your system. The change
> to PMF driver should not be necessary.
> 
> Thanks.
> 


OK in that case let me first move over to a newer version of GNOME than 
comes with Ubuntu LTS.
