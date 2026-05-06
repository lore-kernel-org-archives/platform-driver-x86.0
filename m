Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130C3101C0
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 21:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778103903; cv=none; b=SAl4pZAZexOrFjWyrflnYl6/JWngTFpQNJRIj5DJTy1xOaGRtQd6Ew8aCAGSz0nkL2P4Z/vs5DZwrEycMdMYngGeoQYPbUkObl+LTMl7GVnrwzi4LmndHrFemowxMhL5ncux0vKHiB59DgoXU/uFHBRXPbHObTf92hyBvUWdSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778103903; c=relaxed/simple;
	bh=TMnttdfByCuLSQxosH38f692SLfoPJOR1e4JetbKZxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bO958r3HkSdaqzl/jt/3LK1YOzygIo8RbtOGKFpWpu5EyDFwGo+lS1Yk+56xo61d6x1IYi1D58zFIMBGXtF+ZybieNKjBVPzPfIfZjyJrWv3oCPmtrmlP1OqziKGUYiB6KPvTea/UbQClYl21mofIwlu8R/8eHFuhXCQZ0B/8Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LtchJp5h; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LtchJp5h"
Message-ID: <dfe28a80-6ce8-4bba-b151-3c24d385782c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778103889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h9vGLRw9eB69AnuPJqu8P/DgQqRJP2/XBi617tl85lg=;
	b=LtchJp5hwoM+OouL89mLJ0Ed+ZnE6zvF26ZXKoj1E/D+o0O8IyMo0DFtaSWQ0N0cb16dzr
	2vpUzh3z49fli9RZ5OVUHbgjadWPWzEJ9irzyGremFzYcI9Fghjp+0hsPJ0QQ9TzLMICbi
	Xyc4P0VnZJlBjLiN+0V4OOaWGu97fic=
Date: Wed, 6 May 2026 23:44:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: downgrade missing power
 limits warning to debug
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armandas Kvietkus <armundunelis@gmail.com>, luke@ljones.dev,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, fxzxaxon@outlook.com
References: <20260503175734.27795-1-armundunelis@gmail.com>
 <6460ef7c-b4d9-4106-95cc-35710b4798bb@linux.dev>
 <91d3cc8d-ee5b-f204-ee42-ad8825a14a24@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <91d3cc8d-ee5b-f204-ee42-ad8825a14a24@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 5/6/26 13:26, Ilpo Järvinen wrote:
> On Mon, 4 May 2026, Denis Benato wrote:
>> On 5/3/26 19:57, Armandas Kvietkus wrote:
>>> When a system is not found in the power_limits DMI table,
>>> init_rog_tunables() emits a pr_warn() and returns. This is
>>> expected behaviour for hardware that does not support ROG
>>> power limit tunables, not an error condition.
>>>
>>> Downgrade to pr_debug() to avoid spurious boot noise on
>>> unsupported systems while preserving the message for debugging.
>>>
>>> Reported-by: fxzxaxon@outlook.com
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
>>> Signed-off-by: Armandas Kvietkus <armundunelis@gmail.com>
>>> ---
>>>  drivers/platform/x86/asus-armoury.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>> index 5b0987ccc..c8e9ff89f 100644
>>> --- a/drivers/platform/x86/asus-armoury.c
>>> +++ b/drivers/platform/x86/asus-armoury.c
>>> @@ -991,7 +991,7 @@ static void init_rog_tunables(void)
>>>  	/* Match the system against the power_limits table */
>>>  	dmi_id = dmi_first_match(power_limits);
>>>  	if (!dmi_id) {
>>> -		pr_warn("No matching power limits found for this system\n");
>>> +		pr_debug("No matching power limits found for this system\n");
>> Maybe this is right to get downgraded, but still no debug: I think info is better,
>> but I would like to hear from Luke what this is about.
> Hi Denis,
>
> When kernel is built with CONFIG_DYNAMIC_DEBUG=y, all debug messages 
> will appear if kernel's cmdline enables it:
>
> dyndbg="file drivers/platform/x86/asus-armoury.c +p"
>
> (wildcards too could be used where helpful and semicolon as a separator 
> if, in rare cases, more than one filter should be necessary).
>
> So all we need is to ask the reporter to boot with dyndbg enabled for the 
> relevant file(s), no recompiling the kernel required.
>
>
> I suspect most distros do have dynamic debugging capability in their 
> kernel configs so it shouldn't be a problem when they don't by default 
> show these messages (at least the two major ones I just checked have it).
>
Hi!

My position is that the experience of most users is:
they boot linux, install asusctl, notice that not only is less fancy than the windows counterpart,
but it also lacks TDP sliders so they enter in discord and ask "why can't I control my TDP".

As of now one just answers "dmesg | grep asus" and the warning appears, while if this becomes a debug
the process becomes more involved, for both parts, as most people know dmesg, but a person randomly
hanging in the discord doesn't usually know how to enable dynamic debugging, or how to reconfigure
a bootloader. I surely don't know how to configure every bootloader under the sun for every major distro.

My point of view is that said warning guided someone straight to me, so it reached its objective effectively,
why changing something that works?

The only reason I can think of is people who run with panic on warning, but since I have yet to see an asus
laptop that doesn't make linux spam a bunch of acpi errors and warnings such a kernel (as of now) is
unbootable on these machines.

Perhaps you have a stronger motivation and can point me to it?

My current opinion is that instead of demoting it from a warning I should perhaps phrase it better
as Mario suggests.

Denis
