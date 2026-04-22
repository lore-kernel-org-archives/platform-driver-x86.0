Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481C63563D4;
	Wed, 22 Apr 2026 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857318; cv=none; b=ROw0vqNA+9BU4e3Wqvk4ywyA6rWcptGd2q85JCJj6unxEcv1LrWi+A+yADRkTMhpVBdQDuKeTiusSIdHqCZaKzlE7IcmFq4u3re/O9K2up2Mal19kmgcWTnzSAOGgF99IK8NHfIgUE/rjC/WlP0VXUfRte33TKwXD1u5RQhwqac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857318; c=relaxed/simple;
	bh=mXW+r7qwp4g/bEGZCt5S9Z0aeKkXMAo/9c+pf12Q6I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SqTR8rIc/0/CC024wzEm1dmaEOt80glqf6hhmSY3d63h3XLZZe4gcQXnm/aUR15t55GyOHSkhYpSYkYZK9ivEMk7EMypRNaaf2tHniDpe1lbdfe7+LvEntY/UT2k7es0CWPTPuCHbhTauIAyy9VcVHulbXHZhhcea4yVjocFU14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rRj637yd; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rRj637yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776857314; x=1777462114; i=w_armin@gmx.de;
	bh=GeHDQXJYU/B/c/59BAtFFyD0s/+zC9hOb00WeJL2Eiw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rRj637ydDBtqoqx1iE2sRLeYTSgxlCEuKrMoIfwTry4INMVMauTQ8vc3a9IYtgL/
	 EBQo9Nzxrd1frl3bQtJD+6fhg0g4DjfniNI/YKuFviFQ3O/UQu/bnqci/RpQZ+b9m
	 x0j1NKm6twxf/cFu9PZ8MkKtsUxahbo596uRt0S9Gcm9W6tvtxMbaKiPydakuJwTX
	 rdtGIRAFqOqqzAD8TY0tY8d2pa6XRihSXsuPo6bD+nP70O3+j9/pUF4S6Tmnl5wyK
	 y/sb6RsC+DyPRi/0z7VFdO2Qm6YtQIsJBYVtwX0qMf+YF/+OLxo9mCuSom7R7MQpz
	 MbQxEc09kkIiGrkdVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MI5UN-1wCza91UeN-00188u; Wed, 22
 Apr 2026 13:28:34 +0200
Message-ID: <00de99ce-cb58-491d-81fc-f8bfb8ea4a16@gmx.de>
Date: Wed, 22 Apr 2026 13:28:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] platform/x86: uniwill-laptop: Another improvement
 and another feature
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260421201103.142403-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4G+L/Hq2AcYZoGSckIgO2As8oFH4wVyXlwjXe90x8ClWgA+SBKW
 6oyWp994Hzhjfvx33j/+3ZQfu+WhccFx1i/kiYnY9qfzAXRfX4T6upbwXHPyXxJqUoAqYzy
 2Cs0qTdh9yF4D3ssCnWq7HZo+0Bw3S5Lci1jwdMdk0Le8KURCPP0nibes2pSdaQ5En8KUjZ
 NOaa77KnAK4TKTPha1Fvg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f+SjNu+LRKk=;uME4RGmVxvoGan5IMqNOFByHutG
 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
 DSPerxNZXxzkSTUwXes3o5/vwzU0VjA6ADBk=

Am 21.04.26 um 22:01 schrieb Werner Sembach:
> Hi,
>=20
> This series is based on another not yet accepted series
> https://lore.kernel.org/all/20260417050912.5582-1-W_Armin@gmx.de/
>=20
> RFC because of that, because the third patch is not yet tested, and beca=
use
> I have a question regarding the 3rd patch:
>=20
> Should I abstract the call to wmi_evaluate_method away in a wrapper
> function in uniwill-wmi somehow, or is it ok to have it straight in the
> uniwill-laptop code like that? It is quite self contained.
>=20
> Best regards,
>=20
> Werner

Hi,

i prefer having the code for this WMI interface inside a separate file.=20
I think we have to first rename uniwill-wmi* to uniwill-wmi-event*, then=
=20
the new code can live in uniwill-wmi.c

However we also need some synchronization mechanism between uniwill-acpi=
=20
and the new uniwill-wmi because some code path need to check EC=20
registers before enabling support for local dimming. I suggest that you=20
use the component framework for that. Basically the new WMI driver=20
registers a component during probing, while the EC acts as a component=20
master _if_ local dimming support is present. When the component and the=
=20
component master match a sysfs attribute is registered to allow=20
userspace application to control this feature.

Thanks,
Armin Wolf

>=20
> Werner Sembach (3):
>    platform/x86: uniwill-laptop: Make super key init lineup with other
>      inits
>    platform/x86: uniwill-laptop: Implement lightbar for XMG Fusion (L19)
>    platform/x86: uniwill-laptop: Offer support to activate local dimming
>=20
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 195 ++++++++++++++++++--
>   1 file changed, 182 insertions(+), 13 deletions(-)
>=20

