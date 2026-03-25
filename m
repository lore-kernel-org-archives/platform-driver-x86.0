Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A9309DDF;
	Wed, 25 Mar 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443695; cv=none; b=cUIKSJu24fu+iNo29nnZY2INBoezqUWukrb0w6t8a8LnfRlGMtyzalLSjEusHr5HJzBoAD/IJybOPj8Iv6k6+as2aURVIVLQfW4Znx7RKr4loiugtPweprQV5iKc9OtswoZ/z6l7yKw5zvP2V4LjQ5m94Pi+w7Ygb3y3dEyuIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443695; c=relaxed/simple;
	bh=26Z736u1CGRmc5e5+kmfaUIgdnqJU+sOryiH5sWooFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1Rlta3Yv4nmCovBHT5doSjnh24Oe+4eJ5LMWcX3Q8REb+pYnKpAfpq/G0qAcYXtgTsbFa77wuK7FqB3MjC7sfMlO/S2VZHGIesHpoOVS+9Y1llK5CF1IACDRehP2t9gtoCyHI00uWXTFybF8elCdpyUGsVpIDyWYwUE9DSmexY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XvI5e44E; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XvI5e44E"
Received: from [192.168.178.24] (i5C75F6C1.versanet.de [92.117.246.193])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 600942FC021E;
	Wed, 25 Mar 2026 14:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774443690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fcj0iHAnmjA3JmVVJ1pIOrCbEsFTfBqlY6QEBpU+UO4=;
	b=XvI5e44EG09vZ7o4J61gZ4NWgd845wJpLXTwXmJFANQinqogI3JX3loBQV5gIkcvTA2HO2
	yBXjzQURd1ridLGpcYJEhwvVuDRE2lYEWbSufT5JSFcILi4+xjcwlV+1uWXKDwX7hgJOv7
	fY22GAhMnosqwe5AblqkI4qlKeGwzyM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <84878980-ff70-42bc-8556-0a21f30a5290@tuxedocomputers.com>
Date: Wed, 25 Mar 2026 14:01:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] platform/x86: uniwill-laptop: More support for
 TUXEDO devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260324203413.454361-1-wse@tuxedocomputers.com>
 <704a7de4-ee2e-5f1b-56e1-452fbb1af242@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <704a7de4-ee2e-5f1b-56e1-452fbb1af242@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 25.03.26 um 13:40 schrieb Ilpo Järvinen:
> On Tue, 24 Mar 2026, Werner Sembach wrote:
>
>> v2: Incorporate Armins feedback.
>> v3: Incorporate more of Armins feedback.
>>      Rework USB-C power prio functions
>> v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
>>      Replace for loops with if statements for USB-C power priority functions
>>      Add missing mutex in usb_c_power_priority_restore
>> v5: Restructure patch around new entry for XMG Fusion
>>      Add missing Reviewed-by and Tested-by
>>      Spelling fixes in documentation
>> v6: Fix small format error in docs
>>      Fix Reviewed-by line
>> v7: Variable rename to lowercase
>> v8: Move USB-C power priority init to after probe call
>>      Clarify documentation
> Hi,
>
> Does this conflict with something that went through the fixes branch? I
> tried applying this through for-next and get fails so I guess I'll have
> to merge fixes to for-next before I can apply this.
>
> It would be nice to mention any known conflicts in the coverletter.

sorry, I thought the base-commit line was enough

it applies cleanly to v7.0-rc3 and v7.0-rc4

earlier rc versions of 7.0 are missing a required patch

maybe for-next is not yet rebased on the latest rc?

I will have a look

>
