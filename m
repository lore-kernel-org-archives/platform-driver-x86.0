Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC632FA14;
	Mon,  8 Jun 2026 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934446; cv=none; b=KM+9FAeHmDC5GCh0LFhR5orKjosufNHFFj7pt6uwoTGVYyacjPAZp6DYwZc7D9tabO1C1dLkKr3r/X2mF9SNOGFfQTBBLO3vi5x13yk9peQ9Ibt7ludVw7ka5xMYiq3VAjpM3uDyVJIOyx2XrnDTC5t+QxlC2xVw1iPKzF2vt14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934446; c=relaxed/simple;
	bh=b5oNxcBJaQL6BlPhYU0OTcX/fw4jMhRje9CYznDD7UY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IQ4YkGQlZEhoy/thNC61su2zIg0RwtD7HiHfjcGwtfV1dfXSROposmAcEjc4Z3xdWxeBFifmkhuxQcVJmPNssnMMPRmuIweG4fKXOpvqq08/lTTu+4t1H5UFiMz9GLGfvAAYXecoObksUuufHqo2YAWbWnwADQhYDJMTx1wh3XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J79mlQmy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J79mlQmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4AF1F00893;
	Mon,  8 Jun 2026 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780934445;
	bh=qoT3gk4y/TjUBrTbuBwxPqfNKHzAla8trjHQMSpUwTo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=J79mlQmyn0bC35DXT/cQ7CkrMY4DCV/KbmngZ5qjrS3Z2zG/Uo9TTdRhJ4NBWTAm/
	 ukp6k+fHqyZDiMfkFM3tehgnl9b3PSfJ2pQT0c1m0aN7srhpJ9Vu53xFOOHOQFToSt
	 7ZZaCdIULZYemjKtU6jbjIpLcv/L4lvU7ViUVA/7bOs5kBCC4cEHcE5VxmZnqpLNa4
	 7DiS+hPMUXkveecldfiyz6MwZ6amQXp8rWlOs17U/5xPdiqw0bV3fAphUTza8oSp/v
	 lppzEMMY+48FleYKv+O1zp13uFTpsON0q1EbMiL5ar4w9TNVddi0hyFz99oIkkW9tn
	 UjT6r77Lc+dOQ==
Message-ID: <1b5791c4-04f8-458b-ad9d-6bbb3ae1bf8f@kernel.org>
Date: Mon, 8 Jun 2026 18:00:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
From: Hans de Goede <hansg@kernel.org>
To: Pit Henrich <pithenrich2d@googlemail.com>, hmh@hmh.eng.br,
 Dave Carey <carvsdriver@gmail.com>, Armin Wolf <W_Armin@gmx.de>
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 ilpo.jarvinen@linux.intel.com, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 pithenrich2d@gmail.com
References: <20260419102724.91451-1-pithenrich2d@gmail.com>
 <84f822c5-ff42-453a-bbd6-3b2afba28621@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <84f822c5-ff42-453a-bbd6-3b2afba28621@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8-Jun-26 11:09, Hans de Goede wrote:
> Hi,
> 
> On 19-Apr-26 12:27 PM, Pit Henrich wrote:
>> ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is magnetically
>> attached (on the screen), but thinkpad-acpi does not expose this to userspace.
>> The state can be obtained via ACPI methods: GDST (get device state).
>>
>> Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
>> a DMI match. The state is read directly from the EC.
>>
>> Cache the state and emit a sysfs notification on
>> TP_HKEY_EV_TABLET_CHANGED (0x60c0) when it changes. Initialize the cache during
>> hotkey setup and refresh it before the resume notification to keep the state
>> consistent across suspend and resume.
>>
>> Signed-off-by: Pit Henrich <pithenrich2d@gmail.com>
>> ---
>> This replaced the v1 patch in:
>> https://lore.kernel.org/all/20260314142236.74514-1-pithenrich2d@gmail.com/
>>
>> Changes v1 -> v2:
>>  * Use ACPI method instead of using the EC directly (thanks Mark).
> 
> Thank you for your patch. It seems that this information is also exposed
> via WMI and a WMI driver exposing the same information is also being
> worked on:
> 
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20260527122701.242907-1-carvsdriver@gmail.com/
> 
> +Cc Dave Carey (author of that driver) and Armin (WMI maintainer)

Ok, I should have looked closer, this patch is for a "ThinkPad X1 Fold 16
Gen 1" and the driver I linked above is for a "Yoga Book 9" so I was mistaken
that these drivers are duplicate, we will need both. Sorry, my bad.

Note not a full review, but before we can move forward with this driver,
you are going to need to document the new sysfs attribute under:

Documentation/admin-guide/laptops/thinkpad-acpi.rst

Please add a new "X1 Fold keyboard attachmen" section directly after
the  "Hardware damage detection capability" section (or iow just above
the "Multiple Commands, Module Parameters" section).

Regards,

Hans



