Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780AF32ED3F;
	Tue, 20 Jan 2026 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938375; cv=none; b=oMaaggYi95A3blru3uJvXzl1lJ/v0z34z+1Ccav0ZHWd3S/XkaLuswRmvXS3vIL2Qg8cvATxsMZFiylhngjuYOHc3uc1u1fygHjLci0mIxdti6+g9tvgAmUpv+kYg0Mksx6osFho2GKom9AOZsMQtf5uFu3YZchC01DjnIwNBLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938375; c=relaxed/simple;
	bh=OudiWqYSZYf/InTBQfCSEYxpeKMot6FZx40txy+Imig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOn0sYA+uw4mdULpbUihkp53+IXxSXiIcdj9r/OBmNrx45UBOwsHfwtEMWlzCTTN7HyZjf9QuSstf02nOLsrTHUBgf/98YNVpvSH/fyYBh51y0+fpQ7pCtzBSi355b4w5+9X1AF4NbqPVOjK/plihwrwhKiWCEEk90jrUtil5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jeXEzMzF; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jeXEzMzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768938363; x=1769543163; i=w_armin@gmx.de;
	bh=OudiWqYSZYf/InTBQfCSEYxpeKMot6FZx40txy+Imig=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jeXEzMzFVY+/tlmowyStlj+hSUUvrRTAXzAa5lL0nAu4OeLeRs9QQ8ODM8R5Ofas
	 LpyDK+P3q0EwEl9FY4sM6QHQi4Flcg3caYT6JUUr7QuVRj+DurAHnuia4pYeUjsW5
	 VT2Wo97o6rqDoYQu1wyj/rz7tKjLNQlpAIaaS6SaWe9iUmwF7UkXKLa5VwSmN0ODk
	 xXKAjuu2kSCgScbpAEL9EuQ7cLUMat+oXbowrIl9va5ENkT64JpDWKK2I8RmNE2yN
	 WaSPWgVSSojjUf28wFe1wxG/ay9QIs0jAj/PT9Z5XiACRagoCD1nhLID1p0inIoId
	 XiwVFHMn+ZFEWNhs8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLiCo-1vQcGY3GCm-00PLvU; Tue, 20
 Jan 2026 20:46:03 +0100
Message-ID: <ec3c8ebc-222f-4f72-8afe-c10b0bb470ac@gmx.de>
Date: Tue, 20 Jan 2026 20:46:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: acer-wmi: Extend support for Acer Nitro
 AN515-58
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: pranaypawarofficial@gmail.com, jlee@suse.com,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260108164716.14376-1-W_Armin@gmx.de>
 <2eb1b234-99cd-449d-88d5-623c108e2ce4@gmx.de>
 <41f1d093-21eb-7621-96eb-1b51f8b62541@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <41f1d093-21eb-7621-96eb-1b51f8b62541@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VEM60z5wvV+cW70zVr07lSaF+NCBlH93dvN7OVm1toDQ0dDw502
 RFk00U6kpm6t9Yej5Mv4yaP6siwl3k+VepQQ+1pz2NZGBwkRI9KxWzD7g4nbktS3xvXJ2kz
 ZC/URYMqNuP7x/OkDRC/qxzDxUipBw5FZ38FSQj4aB0g/Wm9iBJ1NP+40I6gV93XnJSMZiO
 VMPC3R+v+/5UsDXGP3L5g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lRS33pUfHZw=;3AUjINadHM4+7DrPkj8XvPFl795
 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
 IlLoM7RtffwUvob0AOU79use/bjhANQbKkSWiA

Am 20.01.26 um 16:13 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 19 Jan 2026, Armin Wolf wrote:
>
>> Am 08.01.26 um 17:45 schrieb Armin Wolf:
>>
>>> The Acer Nitro AN515-58 additionally supports fan control. Modify
>>> the quirk list to enable said feature on this machine.
>> Any updates on this?
> Hi,
>
> I'm sorry, I thought I had applied this (and it was marked as accepted i=
n
> patchwork as well as a result) but apparently hadn't. Thanks for the
> reminder.
>
> Now it's in the review-ilpo-fixes branch.
>
Mistakes happen, thank you :).

