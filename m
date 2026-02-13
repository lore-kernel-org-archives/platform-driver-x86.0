Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560BC2737F9
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770998718; cv=none; b=MCeax7UcAM1x0QUpZsJmN22ZpscJadln3EsypKZUHj5JJau+RZEw+gyIkUdWfofLK/ezr8QhCFIWkh0Lqcsy4GOQG1SLB8wKCsMkgPQehoXqhwxvspdYN95nWXaGO7cNf2Z1gSf+xnzfhgaTuvNijvCKcNqIjLE1ZQMwAa8qPvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770998718; c=relaxed/simple;
	bh=42xwYSBq3vgchejRNNafzFRp47DUiA653bWte/vKJuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdeW5MTuG2OVNOFCOPG1MC4tAQMJm9BqoCskgux5OKfst076PYeQYOu9VhqJDkNv7SuFSay7nXNYRRzj2ABtXeXIROPYZ2PEVIhEhlibxU3LLFvUtT50bkcunKh57i18uCW6vUUrHp/qjA4klZ8bcM2F/7hVjo/EtZ5WrlXxOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNPhWnMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNPhWnMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DD5C116C6;
	Fri, 13 Feb 2026 16:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770998718;
	bh=42xwYSBq3vgchejRNNafzFRp47DUiA653bWte/vKJuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oNPhWnMd3u5hVk/xdja3l70WPJ1wVu0kHTm+FUB6sG169wEwT7sR/a+dfdL+MqnUj
	 1hbvjQLA4HjvaxlclkOX8WNwz+lbml1rs/s4mGeW80ohFC3pPA+pxciN7ghHuJKxny
	 xVcQUpHp+shO6cwUPBzHtCrZjiUpqtGxe6LXHIvM8jvE7EL59HBFcChl9laEwzxpqf
	 yJ8y0nWwB+p2CZ6HYyedGAk+MN8cbwlkwcs2bs4ffi8SUMgZLwHJT1jCoWZz879S2W
	 fHoHTcL5uMBpcuaiiCdbZ8saMEBCCGhumux+XoloFse7l/XHxx4j33obctZ04eiDYE
	 1vG0DIsZ7o8Hg==
Message-ID: <4db8b222-c80b-4333-bacc-25c1422c8e94@kernel.org>
Date: Fri, 13 Feb 2026 17:05:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Bartosz Golaszewski <brgl@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
References: <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com> <aY318Dg9gMU1KFvx@google.com>
 <aY38A8MbctpAgDqS@smile.fi.intel.com> <aY38ZBTfbf9a7Unw@smile.fi.intel.com>
 <aY4EqvRduJnlg3iC@google.com>
 <CAMRc=MfmYw0oSkc7Td=Pzwb97DzA4ym23gcqZPSKxHuQQhAx_A@mail.gmail.com>
 <aY4K2qbxNmsotwu3@google.com>
 <CAMRc=MeekJ=-OeqjUV-_WZ9g=tsNb-6XrKMi_6gPgbhGCf49KA@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAMRc=MeekJ=-OeqjUV-_WZ9g=tsNb-6XrKMi_6gPgbhGCf49KA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 13-Feb-26 14:41, Bartosz Golaszewski wrote:
> On Thu, Feb 12, 2026 at 6:19 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>>>>
>>>>> OTOH, if there are more than one of a such controllers in the system...
>>>>> And it can be found by reading the links that one of them related to
>>>>> a certain GPIO device. So no insisting on this.
>>>>
>>>> If there are multiple such controllers we cannot use a static software
>>>> node anyway as it should not be shared between them.
>>>>
>>>
>>> In such case they should do what OF nodes do (and I'm sure ACPI too):
>>> use some ID to tell them apart.
>>
>> You are missing the point. You will not be able to use a static node and
>> export it. You will need to create a dedicated software node per
>> instance and the provide a lookup mechanism for whoever wants to use
>> them to locate the right one.
>>
> 
> That depends on whether you know the number of instances, doesn't it?
> If that number is static, you create an equivalent number of software
> nodes.

I think there is some miscommunication happening here.

I _believe_ the troublesome case Dmitry is trying to point out
is the following:

1. A single GPIO controller

2. 2 different drivers which need to manually add GPIO info
using a swnode with a properties array with  PROPERTY_ENTRY_GPIO()
entries

A (so far theoretical) example of this might be both the infamous
x86-android-tablets code referring to this single GPIO controller
as well as some ASoC board file under sound/soc/intel/boards/
referring to it. In that case having them both declare a swnode
for the GPIO controller and then both have them attach that
to the GPIO controller themselves (*) will lead to a problem
because only 1 swnode can be attach to the GPIO controller.

The obvious solution is to have the GPIO controller driver
create and attach a swnode and have it export that swnode
so that it can be used in PROPERTY_ENTRY_GPIO() declerations
in multiple drivers consuming GPIOs from that controller.

Note, I'm not entirely sure this is what Dmitry is trying
to say but I think it is. Regardless this is a case which
I've been thinking about how to handle myself :)

Regards,

Hans


