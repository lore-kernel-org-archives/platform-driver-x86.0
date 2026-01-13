Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DDC34F46A
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768341236; cv=none; b=m0VWzi0G9+mo5SassliPX/NxY1Pmi0PuTNU6NvfYKNesSZRFyPi6NDb3X/I1lAK2SRk5hlmxU4rO5oxi1eEfnsfD3/dHGB55Obs2N8Ngc8hsZ2IWKbN+XcOlZ+LaZgkt7rAuLBlWDG/VOmGFVNUw14w5Vho3w8DZbaRJVJD7aWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768341236; c=relaxed/simple;
	bh=Nlfzr/VkEwdNXyk12U5CaOV50mDJ2G2+jYnNZCgY53E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cu/BKjgnd0VibQ6wGrrOWSQznXT8AXk92MjGC4nTcnpoZ6jdED0cS7q7FvWsyXcJDzwd8EbuS9uCXX2ShO30Dsv8MOk0sNZg9RWDsyQWZCVIoF3hX6Aes6ZwogTCaCqc4Yzm7s+rQcyvm4rhlKGjLA/z8nhy1knsihD5wGbzTpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=anFTu/CZ; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="anFTu/CZ"
Message-ID: <2e1f5ce5-3647-4dff-b67e-327b0c1cb12e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768341232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=muH3UgLALFf05MsDXXAEqhqttHCXkSgTJDYBjU4vZ4I=;
	b=anFTu/CZJX2hdNUHbiq2GRBcKVC6SElAJRW9bqvCh1cdP3pyvagVGd1rrU2pW8U3SVyPkx
	ER4cevkSQs3Q80yv3E7sj25adQtOt//ercU+dPUjZs6I7erP2fqiZa6HAhAElCxRsE9Qbu
	vHhPHLn5kegj1X0YT/zsqxeIsGlnMw4=
Date: Tue, 13 Jan 2026 22:53:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] platform/x86: asus-wmi: move keyboard control
 firmware attributes
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
References: <20260102234344.366227-1-denis.benato@linux.dev>
 <88609e7c-3348-440e-adc0-eed9dc4d452c@linux.dev>
 <992b2843-4afa-ede1-d276-8ccaa61b1fee@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <992b2843-4afa-ede1-d276-8ccaa61b1fee@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 1/13/26 15:02, Ilpo Järvinen wrote:
> On Mon, 12 Jan 2026, Denis Benato wrote:
>> On 1/3/26 00:43, Denis Benato wrote:
>>> I was recently reading through the asusctl issue tracker and I found
>>> out that some users have been having troubles with the keyboard RGB control
>>> that was working before since the creation of asus-armoury and subequent
>>> deprecation of old sysfs attributes.
>>>
>>> This patch series aims to re-introduce those attributes in asus-armoury
>>> so that userspace tools can still control keyboard RGB lighting
>>> without having to rely on deprecated asus-wmi attributes.
>>>
>>> In addition to that, since disabling OOBE is essential for controlling
>>> LEDs on some models and it was incorrectly tied to deprecated attributes,
>>> this patch series also fixes sending OOBE at probe time.
>>>
>>> Link: https://gitlab.com/asus-linux/asusctl/-/issues/619
>>>
>>> Regards,
>>> Denis
>> Hi Ilpo,
>>
>> I see no comments on this revision, did I sent it at wrong time?
>> Should I resend some other time?
>>
>> Sorry for the question but I don't know if something went wrong,
>> and if so what exactly.
> Hi,
>
> Nothing is wrong, I've just had to spend time on finally processing 
> some larger next series which were even older than yours. And we're only 1 
> week past a holiday period which tend to add to delay.
Oh okay, thank you for letting me know! I feared I repeated the error
I made on the netdev list :)
> Patchwork keeps track of pdx86 patches:
>
> https://patchwork.kernel.org/project/platform-driver-x86/list/
>
> If your patch is listed there, there's no need to ping as I'll get it it 
> eventually (and it won't get forgotten).
Understood! Sorry for the inconvenient :D
> There's no "wrong time" to send a patch to pdx86, only that when the 
> merge window is open, I might do processing of any patches during that 
> time. But unlike some other subsystems, we don't disallow sending patches 
> during merge window or any other time.
>
That's very good to know. Thank you very much, always very informative!
