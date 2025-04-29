Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344E21B9E4
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938894; cv=none; b=i/7FrSJwvbWSljnunLDG722/CcAMDdcRMqz6vVw5FP6sLFtSjLtJT6CZ0Co3Fmzl3dyheFCWKGWoKC5eFY6e+kEaHeX4SINZjCh9Rc4jLQjTQgyCAEcM/tEt1Zd1/xAqZ8QIZ7JyeQViEa/xjw/5pMNxNe8znrcn8Xk5nr57yW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938894; c=relaxed/simple;
	bh=3nZYDzxocmdJDR6/OCgyySRjLdbSUwVb97XBzJAyqtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6YHf0FAjQHRXInwCZCaIG0M6g+Bp/+nfNXap7760Zwb4sEzXqQkRA2gGxKaE1rbdt3E3Hyrgbw2/pMICvxrrbhU8HfIeQLy7CDdCfAVgIxnOBo8enNcr0LSwHB1Da69yXY909671GnhLIqFL2VRBXAeQC4IXAJY7yN3ljJwRN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JSJAm9EE; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JSJAm9EE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745938881; x=1746543681; i=w_armin@gmx.de;
	bh=FhP+TkNcpJ3PNSfWlMMAtCN8k4/b4BtEwQ3aIlE6O6M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JSJAm9EELgeHalOTmlUpJmnBge47jUX5IK9ACReO2eZ8f3Hwk2fKOGqTfie0o9Qh
	 pFed5MppP6T3WMTBqfl4pKSsaYE6XOImiCHxeq2f3TVzXnHDPgzLeo9rHNAzufaSH
	 A0Qodzn5bJKOlXcNvm1rxdKiGHlAESdSGCZLrGTDCiq+iMdvohRB3JPx0h8TiFVp0
	 niTTI+lDIVaaTXWTg3LU0J7bCxAEkjIj1iz5pDGlyUIqN0SRaGQLtlIJVasIzPxc+
	 ENiG7vO9gEF7+B2KOZtdy7pLzkUorZSA478upftM2FbX1j2xGFa+k/1X3MKzSfRhA
	 DR+/NmUBO1TZXdKE6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3se8-1v98SG3TIe-00rbvU; Tue, 29
 Apr 2025 17:01:21 +0200
Message-ID: <d7756075-0133-4511-9a9c-2971a3e5071a@gmx.de>
Date: Tue, 29 Apr 2025 17:01:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging
 states
To: debarbos@redhat.com
Cc: hmh@hmh.eng.br, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.org
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
 <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:g+HkUSNGIH+Dh6xNd7cGBFu/SYb/BJVEyY8eKbjBqwIZWyTJcQ4
 D6K8maH9kwSnI1LErPXQ1CTPicu3st8qIsjj5vMsaBaGitHBVpVFtsjgmaTBtJzh+uJSqm+
 9xnuUtH/xgmmhGQ5iFKdpjUuYo43deOrMbQnTVca0Ro+ItojAzVh/t9AA1Sj7a7V/UwaWD7
 2fUH5kHEwRqovaKx2Dp8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:28CSYe5zMO4=;4PabqUxY/wQXd02s5p67NhoK9ue
 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
 Q==

Am 29.04.25 um 14:04 schrieb Derek Barbosa:

> On Tue, Apr 29, 2025 at 01:43:36PM +0200, Armin Wolf wrote:
>> Can you send us the output of "acpidump"?
> Sure. I am pasting the output after toggling the charging settings a handful of
> times.

Alright, can you check if the event is emitted in the following scenarios:

  - toggling the charging state if the battery is not fully charged (below ~80%)

  - when the battery has finished charging

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
> Cheers,
>
>
