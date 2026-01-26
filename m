Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4700C13D891
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Jan 2026 01:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769391410; cv=none; b=BsWSA7Bjvsyt1Zua/sI4/TFNRLulobWbKSnJ7GGANLQZGH0uE3De73/3YDRwOzsYEM3b+o9xAH4STRCdbJjrhFDD+nc+KKK+lt8yWfYeRiInNnNrXFN6iyilcU+8Xg2ZkX/YMr/HgVUE+dc3c7VYeSImzECYbuCE3+8gDMjNVI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769391410; c=relaxed/simple;
	bh=3ZM4t+YQFnp9pE61E/kHNT1CQWfLGMKbfEq8BDF6CJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjmbTPDwMaTwQGWO+fmtoKCDq/BeCPzn0DT/BpEz9LS5E4KUkmLxeuNl/0WmEV25xG8icIA+qaSmXA1EZdcs4hiyFiQ4sfRvR7aTJx7J18mctj01zWh8n7yaaYCl9jQO+WHsUNDTxlzNU+TQwW+vJAbxM51mYu6JtDKMHz8YOEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pX05qfVC; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pX05qfVC"
Message-ID: <52704f4d-37f4-4eb5-998e-25e098ceef54@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769391397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0onKF6SatXKo4+/U+OT0nCzldut8pD8+4y87FdAEFQI=;
	b=pX05qfVC//qOFN2PxHJgHkqrLzm+641tdXWzbTo9dHyqd5+W6EOQqhZxIKIcVnS0p/OAew
	lhO+kysP2xFgamPg8Uu9GNCGbCKe2bOCdmM4p34cOA5NV/+K2kWTVS9+LvbON3iSDVEwKp
	GnC3r1JRowT78e1oVL+0MSRUM790gfQ=
Date: Mon, 26 Jan 2026 02:36:31 +0100
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
Hi Ilpo, please disregard everything in this patch series except the OOBE fix:
that fix is important and I see it has been picked up.

It's probably much better not to touch keyboard modes without a rework
of the associated RGB interface: it doesn't make sense to move only the
power state and I already saw there have been reported problems
with TUFs.

The original problem I was trying to solve is better solved another way
via userspace saving the last setting with the interface already provided.

Thanks,
Denis
> Regards,
> Denis
>
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
