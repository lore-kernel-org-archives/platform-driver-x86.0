Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76C2F25F9
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250969; cv=none; b=UP6xe0sEWk8vt+bOAsD3Ev8cW9V1en6no8Zn/uyH/8p4yboSZWpsMuAn9NFe+Rage3dKvg5mYSe2uYrMK2zNCpnSCEcaHJYpU9WmjfsTHeUewbut2elDdbSrIvySQfyPYHRmNpbjEutSwUgRm+zHihh3702WQE2lW+l/adQ390s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250969; c=relaxed/simple;
	bh=XLD9xq3l6kL6jdRiWQIQfZGMJpOdDteWKDWVuTEqCbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VSOR1C31dYCjDGvNYZL5VA6ZpZGl5gDCJTDZ20BpkLtFMrCkXb6ILqFZnZXIZ6cbPIkOEWGxfE6WKu9WoDck0YEIULqL9EEXqV+HkxE5SQI8Z/GkGOWo4cw9+yWeVoy0nQPCaWRVq1Weo6smgUdpAhwmF2WebDM8WNNSRhX88KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bWKHIJwB; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bWKHIJwB"
Message-ID: <88609e7c-3348-440e-adc0-eed9dc4d452c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768250965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vIBC0svTxFuG4m+rliGVWh0BFIk6KaQMG6hV+TD0gr8=;
	b=bWKHIJwBSkmStJLbO079S75NVjgFJOBmq3OnX8QRSO5qhwmrDH1rNZJwz8cJOU8JGLGCLh
	Xfx+IRAETSlLqeYRKVZmv6TGFcT6H2Plq2pDUy3d5KOcuJdkuwSUhGoa0VcsQCDpJEGWkC
	wdaR6f7FJXUXtNievSksxfCzVe92XDo=
Date: Mon, 12 Jan 2026 21:49:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/3] platform/x86: asus-wmi: move keyboard control
 firmware attributes
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>,
 Denis Benato <benato.denis96@gmail.com>
References: <20260102234344.366227-1-denis.benato@linux.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260102234344.366227-1-denis.benato@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 1/3/26 00:43, Denis Benato wrote:
> Hi all,
>
> I was recently reading through the asusctl issue tracker and I found
> out that some users have been having troubles with the keyboard RGB control
> that was working before since the creation of asus-armoury and subequent
> deprecation of old sysfs attributes.
>
> This patch series aims to re-introduce those attributes in asus-armoury
> so that userspace tools can still control keyboard RGB lighting
> without having to rely on deprecated asus-wmi attributes.
>
> In addition to that, since disabling OOBE is essential for controlling
> LEDs on some models and it was incorrectly tied to deprecated attributes,
> this patch series also fixes sending OOBE at probe time.
>
> Link: https://gitlab.com/asus-linux/asusctl/-/issues/619
>
> Regards,
> Denis
Hi Ilpo,

I see no comments on this revision, did I sent it at wrong time?
Should I resend some other time?

Sorry for the question but I don't know if something went wrong,
and if so what exactly.

Thanks,
Denis
> Changelog:
> - v1
>   - Initial submission
> - v2
>   - asus-armoury: drivers should be silent on success
>   - asus-armoury: make better use of __free annotation
> - v3
>   - asus-wmi: use GENMASK for flags
>   - asus-armoury: fix error handling in keyboard attribute creation
>   - asus-armoury: fix logic bug in error path
>   - asus-armoury: use proper defines for keyboard state flags
> - v4
>   - asus-armoury: reorder variable declarations
>   - asus-armoury: add bitfields.h include for BIT and FIELD_PREP
>   - asus-armoury: reorganize armoury_kbd_state() for clarity
>
> Denis Benato (3):
>   platform/x86: asus-wmi: explicitly mark more code with
>     CONFIG_ASUS_WMI_DEPRECATED_ATTRS
>   platform/x86: asus-wmi: fix sending OOBE at probe
>   platform/x86: asus-armoury: add keyboard control firmware attributes
>
>  drivers/platform/x86/asus-armoury.c        | 253 +++++++++++++++++++++
>  drivers/platform/x86/asus-wmi.c            |  13 +-
>  include/linux/platform_data/x86/asus-wmi.h |  18 ++
>  3 files changed, 283 insertions(+), 1 deletion(-)
>
