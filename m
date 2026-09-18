Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4184FE2E2;
	Fri, 18 Sep 2026 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741137; cv=none; b=MTvVru6ucua5GxppnXt/d75dltFhsHqOQSDnjmLyugyHt5986q8IANQc3eo7HFs7N+m7kFZY70awgNvPfbfYgSzK8dh3+TWjeVHu/u8rX2xZMOw3rYatDcSmTvP59fM88PglM2SaH5GFnm7l8L4UvKx9HJH8rFvzZRkuvUSgMUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741137; c=relaxed/simple;
	bh=PcDzaaxfb0rhR+5lYjHCFqKn+Ut40zk/2gK6xkGBfK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5/nb1vj/5qMKqV6uQKrA35iqro/lTunaN8RhgP7ldW9WzM8SIXm7QH9Ro7FubL7oBA9SOgz2O/QQLXHcfE5pWnxfGCirHB3NA4Jq/RPSYfXqeW9w29gKO6C2SuFqTSDR5RKhYeg5x7x8Tzarxp1ff5NPlXcFm8O3B9rphj0vQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=aYjayjPN; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="aYjayjPN"
Received: from [172.18.121.98] (unknown [185.104.138.149])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C7F8C2FC0063;
	Fri, 18 Sep 2026 16:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1789741125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmSxYmLzwhK3JELWTJdj2hV8xZNtCkBEBzkvcxFdNVI=;
	b=aYjayjPNqRhF8xedaOlQAGRsqnXF5GSVYLJf63MHOyyfBjjVO1Cu1UqOakhL9XE2S6KW9O
	9QINkQtATmqW2stFi5ZxuGoHTmMm54FnG6BIg6kLuUrByBS/lm/TbvlhihNY1FsXlTCWI/
	9mUaHqkU3LlG2Pie2GzOgaWXFBepWqE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f4e1407b-64b9-4c46-ab0b-76e6a33512f2@tuxedocomputers.com>
Date: Fri, 18 Sep 2026 16:18:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86: uniwill-laptop: Enable kb backlight
 and lightbar for TUXEDO
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260822003012.851574-1-wse@tuxedocomputers.com>
 <20260822003012.851574-2-wse@tuxedocomputers.com>
 <1bf299f1-6b97-db97-3bdf-7c0b41999022@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <1bf299f1-6b97-db97-3bdf-7c0b41999022@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 17.09.26 um 16:45 schrieb Ilpo Järvinen:
> On Sat, 22 Aug 2026, Werner Sembach wrote:
>
>> Enable EC controlled keyboard backlight across the board for TUXEDO
>> devices.
>>
>> This has split up the device descriptors even more, so the "featureset"
>> naming scheme was dropped in favor of a "generalized board_name" naming
>> scheme.
>>
>> Also Stellaris and Polaris Gen3 are now identified by product_sku to split
>> them up.
>>
>> Also some TUXEDO devices with lightbar still had the support missing. This
>> patch completes the list in this point.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Hi,
>
> Could this change be split such that mechanical large-scale changes such
> as descriptor renames are done in own patch?

The descriptor renames are mainly because there are now more descriptors 
required and most of them after the change only apply to a few Boardnames.

So doing it in 2 steps would either mean:

- Having the old descriptor naming scheme and the new one side by side in one 
patch because more are needed and the old scheme doesn't make sense for them.

or

- Renaming the old descriptor names to new longer ones, because they apply to 
many boardnames, first, and then rename them again as soon as they get split up 
in the next patch.

Because of this connection I think it makes sense to do this atomic in one 
commit, but ofc I can try 2 commit, probably with version one. Let me know.

Best regards,

Werner

