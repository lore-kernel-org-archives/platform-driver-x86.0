Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC42571C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386516; cv=none; b=rQwqC93bDzW9rRLzTGZfCGQ3/wZINxKRKYUiybSrQy9ATarSUekeYHz82Xv9LjcrKpz9USTovsns4LxSd/9ZPrMs6bd4hKGdAlgLAbbShkaUeKDasHmT3hZ8lhRJ9NbTrMwj8Gpez9jmrTlzop3ki4lcHBl0qwUV5e+tv5Em9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386516; c=relaxed/simple;
	bh=gR0nDdomhDDGtUiyIsM9MIcgQLz8PrhlBlxfHbFHHj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KRpF6h+da0c+aaff+3xzt6v3p+/oJwW5W+bEfevTRSuwI5qDSgv3n9UqgcYMXpVLDRaUJMfbAo/eTwBNEElSB4PaAqTBrKRSv1diwOqOAg/kzqUI3v9QDiwcG38k1V0JUd9ha1Wb6Q7dEzph6P/AyRIbgMR1gZreRmrFqZ7THGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=F3ZEy3hZ; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="F3ZEy3hZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774386513; x=1774991313; i=w_armin@gmx.de;
	bh=KCCwnLiuLtk5fmALV7/gP+B63dQg9AbA61vF4yByESM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=F3ZEy3hZh0gVASnfC+PXQ68c4TuEuMJNkdVYjtKGaboRhUGY8o00wW/Lq1hYk9SV
	 21zcijJj5ZnBj6MbY6hqzo6aP70eedehpf8DhoqLceR52CQJWYLWGOYBkFZPDs9qM
	 vwiyP9BJUASuc8z2ToO6JfPyJxUn84L+RBULWeN8bWKzrNFjEK4pMSZlCve8NeqHL
	 YB/GDUYIQO01mZG6tn80TcDQq1ZxYFIrMChub3Yx6dHIBdb0AbA76byJZQ7Fkg9rn
	 xduxoPwf2LBn5NWyarvqraj2Mb0luU5hd3dJatFAfAXDGSyy+/fQem1Wn+xHmhVS/
	 AnOJsNMfy14ECfQgSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1w9Fid45L9-00DMeD; Tue, 24
 Mar 2026 22:08:33 +0100
Message-ID: <81b30359-7090-430d-8cb1-805cf2d6fcc9@gmx.de>
Date: Tue, 24 Mar 2026 22:08:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Internal keyboard non-functional on linux on Medion Laptop -
 NTC816 (Intel IPF) has no driver, PS/2 fallback produces corrupted scancodes
To: Ian Jensen <ianmoellerjensen@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
 <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de>
 <CAJ0oKyRU3=qBQvxaBycQYAyxCaVogzuVNv_M=4=npTkBF=X1zg@mail.gmail.com>
 <18a5bcab-84d2-4957-a053-dabbf900e85d@gmx.de>
 <CAJ0oKyR0VPXz887cJsF+oUZFYVD7QY3F3FXWbjAGZGTmFFV-UA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJ0oKyR0VPXz887cJsF+oUZFYVD7QY3F3FXWbjAGZGTmFFV-UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CPnuwanL7H6kM89F6algCz6pVHsM14jw8+vBYfkSgK2Qx9nRXsx
 x0Ox7Kab/rRGRRdsZikiXmGPzVzTIEwH34BFNASA9vKxo5l/uMJoJYvAijQeY2vUO1Y2em8
 hf7i4j1EWxunKj/oEiH1vFyCopNWoUi4ooK38ui9LWkkkszX+dchvXR+PhMbuUy44tcmpJw
 FRmShbFYTrmE7UtsRVDPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5pLkaLprnAQ=;Dk4J20gsoYVa5GtwEx224OLcv/d
 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

Am 24.03.26 um 21:43 schrieb Ian Jensen:

>
> Yes certainly, my mistake
> Here it is
>
Thank you. Can you share the output of "ls /sys/bus/i2c/devices/"?

Thanks,
Armin Wolf

> Den tirs. 24. mar. 2026 kl. 21.37 skrev Armin Wolf <W_Armin@gmx.de>:
>
>     Am 24.03.26 um 21:28 schrieb Ian Jensen:
>
>     > Yes, here it is attached (this is with no launch parameters, so
>     > completely dead laptop keyboard)
>
>     Thanks you.
>
>     Can you please also share the acpidump with the whole mailing list
>     (reply-all) so that everyone can access it?
>     Also, it seems that the acpidump you have provided is corrupted,
>     likely because use copied it manually from the
>     command line.
>
>     Please use this command instead:
>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 sudo acpidump > acpidump.txt
>
>     The acpidump.txt file should then contain the full data.
>
>     Thanks,
>     Armin Wolf
>
