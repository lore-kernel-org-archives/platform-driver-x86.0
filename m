Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628D256C99
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2025 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208713; cv=none; b=BCAQCg+2eEMhr7xMHP+yx0bB63pWvMF40DpAtCVQ8ozFuIkQAenG4PaFDCujIj0AM54eaQjfq921s0OrV4MOjh7z7TvzjEp5uCN+VuensPShdLWtSC+lm8hR6o0xVFO6JQzzohCqtndWcFM+QpB/JfMZE3ZylvZ7qTguNUVTiTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208713; c=relaxed/simple;
	bh=klduEaDSiFvSyAICVXNSE+xxG72KkBaDKTNqweEJTwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UthGvc+dPM1sN29M16JayCMNZwR8oYZ0CS7pDfoKmFdo0gVTPfgJtD7GKZERcwtGccXgVyhpCkt8ipeu/Nhhj6n4M8qCguOk5hWd8SC1+4rFF5x6r4MW4I0InoQ61loBhHWBfMNXpd4vO3OWi0W0Znvj4pKF04e9hrT1k5IJxYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cCo2e3Kp; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cCo2e3Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1739208707; x=1739813507; i=w_armin@gmx.de;
	bh=klduEaDSiFvSyAICVXNSE+xxG72KkBaDKTNqweEJTwg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cCo2e3Kp1JdlnMO0zXg0/iAHm09wtQyDMp6ZPmz38yobAa2/P2fwesWWdJo4UgFV
	 oFyaRZe+/KGQqP/6aPR9FZ5c/sD5Zuj2GiDoMpVoHSPpCBmrEuDLa5I6mpnUwOy+S
	 1Bt/WVDxKS9IxwM+tiEbF54S654jUQmmI1183BbJBNtOEVAMEHellU1xj2V2xqbsI
	 i/oH4jc7JLsbt9/6WZUu4H6FfGC2MFajy1zJ4NR9CySSdG3MO3WspmCo7pMzs73kp
	 rp30P3KPUoC2genh0Wx8X5CBc5g6b9ZRgBL8L2lSX6HVBaVNJOhQh1Hu6ZtT/xQQT
	 8pLVR6bWjUtfMmhSnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQEx-1t4rZs2h8h-00b8Oq; Mon, 10
 Feb 2025 18:31:47 +0100
Message-ID: <23a35f9a-f22e-4be9-959f-b2e975535d39@gmx.de>
Date: Mon, 10 Feb 2025 18:31:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need help fixing turbo button and power profiles on Acer Predator
 Helios Neo 16 (PHN16-72)
To: Sourajyoti Basak <basak.sb2006@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <e0f625f4-9c55-4021-ba43-668edb9fe80d@gmail.com>
 <083e0184-19e9-4473-bebf-5536b3d5ec10@gmx.de>
 <4d281c36-4996-4518-9db3-e11780f6fbfe@gmail.com>
 <e430d262-8c1e-4c8f-88eb-98a71117e8bf@gmx.de>
 <5c88b97e-d345-4b0d-9bc2-b8abff3a6513@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <5c88b97e-d345-4b0d-9bc2-b8abff3a6513@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0dCF4hfzFAYnAQeAhsAKf8AJW+ZLqlduoxfrKB00SJhMWhq5MIG
 dEvoyegJhNQ2DUd72/RY85HqtRSagziy2Y0v2/UXBq43qWjU+gUG5sAbrfNX4gzvWqU0e9K
 QGgraa6MSC/uVv+BTNd8GQFix4RsXyzvU/z0+su3/Nm2FRwNjmDAmHTU0EHQv4YoFO3xJsg
 KO5siQvc7MLd7/4qK6l7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RGy9IFVRk78=;EWb0WHFH1/f7TPEnFrCoO0+HoJv
 vxEonGbPm75X3HyV8LXfvnHDF6K1Jtqz26b77WiTsgtFyVLhi2UMmZoTFL0JDln9p9qxvCfuc
 BtYQAevFQ9ajrmPJgjVjFtK0eQDut2wH+1/2mQU3XxBm1eNOaRGXYSUTYMtvAhW/sdRRdA+Mc
 LXziu5SNSEXseMdfdatdYF4soMnd53WUVu/E0TefMMwInceGlmb4cb7q86/URGe8q1lDFRI0/
 iwqp9JHRz7aN/3rRyxdv3ZHlzooYj1wcRA0oB3Ltg+LMjbk7HYCdabwOJsxQZ4s9sN77HMh9Z
 RErmdcadQZR/0IjulcRxscXuECFewgTEIoTRdGC1xU+rqA8Vv+Vrdi/ZnWyEBnnIfLvdvCrNC
 kh+u26chyN5Kfke0VthPC+1hTUY4YXtNnaZg5dpWDYa7nfdz670mn9+ts9h70iGiFscryMv9o
 MyBXnxgfqfCjuDK7lElWdDdbeIV3IkRFPZGM0YAHPuvWEue6SKgt+5x9PkedulJ+O0C4itUTy
 E+6cNE/JgUrLImhzt63Q21gSZrki3f98X4PG90WOz+NZ5s+90ujClkNOtS15xMC0FxGoVkSTt
 6vdr6HLrk1VUuQ/3HfRLlKRnqaEqd5LFc5mrPoF8zuNWZq1BbL8/NTCmeYD6IUcD/5hdYiU2+
 aGbG+VfrIXuI7fdS5wnXWLpnTm88jOtYtrOBBIZshM/oTN7R0SCkRBXl4y+bmIWq4e6zJveQg
 RwQsvwrykPsbcYTXap2/dD+P+DXFNQAGy3zdfd1piu2eavUBfWQ1XhAkvQjve5NlW1ir805jD
 sR03j0e690Ae1bT/Yl0rjodrq4WEsdsLPSGM7eEGBSJE35z3QFoLHKGPBjIH8y+a8JpqqCszF
 VNk8E1o/1ivgX0puHlYv5C9g1Iui7GWGEFugSb7lH+zg4JgOMy1k86uoTQFyoHyjUMp2c/iPD
 YpckaVJqfrGBaqKLFMok1PPHExTzNEnE3LFh3u6gjeSL5OdXM7Jy+90K71B1zQxCrNU0sHjJP
 /fVIERXYmVDBgX2qPZrSt4dVjTYn+huDI+/Sc4f6N/sIvYkvoBFe4GBuL5z5O7UDNAprsN25q
 ISOfwQSXiwJGNY8x9LNTuWJY4VJiRHT6lNNx6/lOe810CF0NO7r6OomC3TbBUGJyJusjfoVQv
 fGzXOB1GiZei5pbSTI2JCsD+cNiLl8wLdkHYj3kYNe5ImVmCMGQRnC8I0KEaNFEgyznJpcvhc
 2g+5NFMuHOLWO8Eos9JPC6F3hFcb33J1YvYClwkVRcAUYMYDlk7Fi7oKSOtVEGRFMfwR5X+vG
 H1bJ/Vlt3XR7AHKACt0QUahZ4FDTQTSt/yIJoPXrx7b6pHG49jKsUy62W3/xMBIDVB+yvDudk
 hrfu9DiU3rtNdwnE5mivrj0KoxCn+ceRNHgLpqG3YNLGWDSshiyS7/EWqxaVTVW5MhasffgRf
 jLOAOjRpDprpNSuyGWC0It4UpZGY=

Am 10.02.25 um 15:50 schrieb Sourajyoti Basak:

> On 07/02/25 6:11 pm, Armin Wolf wrote:
>
>> Alright, the values seem useless to me, so we have to try something
>> different.
>>
>> Can you dual-boot into Windows? If yes then you can use wmie2
>> (https:// github.com/vinaypamnani/wmie2) to execute WMI methods.
>>
>> I this case i would like you to execute the "GetGamingFanBehavior"
>> method of the "AcerGamingFunction" object located inside the root/WMI
>> namespace.
>> This method take a single parameter called "gmInput". Please check
>> what happens if "gmInput" is set to 0, 1, 4, 8 and 16 and share the
>> result of each
>> method call.
>>
>> Thanks,
>> Armin Wolf
>>
>
> Hi Armin,
>
> I ran the `GetGamingFanBehavior` function with the inputs you
> requested. Here are the results:
>
>
> +-------+--------+
> | Input | Output |
> +-------+--------+
> |=C2=A0=C2=A0=C2=A0=C2=A0 0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 |
> |=C2=A0=C2=A0=C2=A0=C2=A0 1 |=C2=A0=C2=A0=C2=A0 256 |
> |=C2=A0=C2=A0=C2=A0=C2=A0 4 |=C2=A0=C2=A0 8192 |
> |=C2=A0=C2=A0=C2=A0=C2=A0 8 |=C2=A0 16384 |
> |=C2=A0=C2=A0=C2=A0 16 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 |
> +-------+--------+
>
>
> Best regards,
> Sourajyoti Basak
>
Nice, i think i now have enough data for writing a prototype patch. I will=
 send this patch to you in the following days.
Maybe you can test it and report back if fan control works.

Thanks,
Armin Wolf

