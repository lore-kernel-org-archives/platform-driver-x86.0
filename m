Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E69145A1F;
	Sat, 14 Mar 2026 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773529883; cv=none; b=CFj7LoPOHxccOM7oYmSPnguzFJI4Nkr04zTjgaOlReeGagkz7F+GAkddxuCxqD7KF22S5xxVEeadjat1cDwrvYP8OdnfxCu//HcDDVyZSDB9Vq4jHdzqkMjXef1yApyC7eL7AhabqwUl94Zz6f2GXHKiLOgCce0Q+gh582KsMKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773529883; c=relaxed/simple;
	bh=3CKF0rQl9Ro/4Ce1Zo9y5uWbreOCri0XXM53bAeIRu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rI6jcB6bAiLLoOi0R0RRqSTZV8JPLBInADvDxCAtx5PtbGLmc5N57uK3g88fvNFYeHXdKasDKlxg+AYfSnqebATlYy6VaWYxg9J06ammMOXxb9fdrBvcoYlYkUSi7EAX3vMiFaqyyjtdQfW9OnFWIQSNbv7FvefbMzpIvfYvJbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=k+/dhGwQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="k+/dhGwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773529869; x=1774134669; i=w_armin@gmx.de;
	bh=3ETzsAxeIpfO2HlcD7eC+HiLEpLudwwOrex+F2jVl0c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=k+/dhGwQXrxdb9855+91hEiKldzEHp5PrOlo0tSEspf8YLu4Cabu74xdOkWTOZsz
	 VoQ/OCQ+8BHsys0rkl+5KsNTjmVrstxj6cxHcWF0hT9C+3BDjQFPk3Hami0AupSbA
	 uxWr8x3AQ8IDWK1hqkgIY0oBc7i3ad/BYw1g1YYLhBuOWtqkC6jDwFDrdw9OkTZPD
	 IPcdqkFTTEnqLMj4AZTE8LlVdLpPlgBMdEQErxJ3B2sIZcf/ZZmq36UfJrnX/c7vB
	 51HehQw3dt7JY17S9K/GBEZE+pv8xx/hlzAHE3Pgdsag8ap2UTEOJyVv8mxle3fbf
	 SWwieB6F5519i0n2jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7JzQ-1vyGLh1BKW-004ltS; Sun, 15
 Mar 2026 00:11:09 +0100
Message-ID: <21b44fb3-238a-417d-b414-e7903b8fdc18@gmx.de>
Date: Sun, 15 Mar 2026 00:11:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>, lukas@wunner.de
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <aYx6ocvaFHunfP5f@wunner.de>
 <20260314224503.12022-1-atharvatiwarilinuxdev@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260314224503.12022-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:0OF1KvIhcTBh9xQRR5Y2WLIOXLaVBhc3n88mdytVgyLcD03Ne46
 dp6Y+XVJukKr2zDnHjIp73+pxj7k4uZF1btr+pV37GXFAfdEYblVGWUPBpTObQeXGGkpB4x
 +3IAPGRKUuKpFUo8ctWdY5GmLwUY/WMThyAe5JRzNTcwD9zXIyB9+wzN7dNR6GdXPOfHXmN
 9Go55uzvyhLjMAhBNap7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jp8VowVE/tI=;nLopPp1sVlnrPpbyR41F69L3/4z
 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
 en0faM9acGwSM2Hj2bUm

Am 14.03.26 um 23:45 schrieb Atharva Tiwari:

>> This version moves the EFI handling back to the gmux driver.  Why?
> Because the platform maintainer just NACKed the EFI backend driver, so i
> cant do anything
>
> https://lore.kernel.org/all/c2d14818-1c34-47c7-a210-1f7c737f0bc9@kernel.org/
>
After reading this, i wonder why this functionality should live inside the kernel after all.
Systemd seems to already store the backlight brightness during shutdown/reboot, so maybe
having a small oneshot service that synchronizes those values with the EFI variable during
shutdown/reboot might be easier?

Thanks,
Armin Wolf

