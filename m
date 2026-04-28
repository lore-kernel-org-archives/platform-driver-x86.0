Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849953BADA3;
	Tue, 28 Apr 2026 21:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412133; cv=none; b=cg0CbeOqbBsX+o2dW11HCOFKNdRMIAZ6b/Z0sEMJCKUtV4QoEDbGXJneReicFTFvRN0Sh20i/1DyG589/qvOAJTu/3BrxfVN1KeCpbhKjHCz7ubj7QHI4pxu79brSwD0aV3edYtAE1a/veXaREqhFKSAArvFyB8AQC/BKr7J0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412133; c=relaxed/simple;
	bh=yf0/P0UMWEmpagCMBLbcwizKfM9jbsr/aRALU2ulw/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=favHvuodVzpqv2nS/cjn9kkIuX1EOKoMJdX78YVmSnncGHqXCPddYfbs1SJXFvez8lbtmFOs8tdeIGsT2PMmRT+5wXyDdrDqRm2W4ch1XuqZFiV4JUPpn7pD0qA/PiQs7U5HwhGGra+F1aEOlS5FGl/zRP6cn8f3BHcm7NRBmfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Q0z+57ac; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Q0z+57ac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777412123; x=1778016923; i=w_armin@gmx.de;
	bh=yf0/P0UMWEmpagCMBLbcwizKfM9jbsr/aRALU2ulw/c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Q0z+57acrItSeW1TueUM91ZMaJ4xP6qgzTW+SmXhq/tnUqXJ4b3Oho4pgpbJqgn7
	 vgeCZIvxx6Y+nf7TYQutHamoDVZM+/Wk9xaahdSxhvWXfdsQXhSy+Hb6U7TOMVdgd
	 yDuWDMc2zqt/QCKkJS0EJOpmu6lN6XWDzyVC0lEVd6QsxNg0SLnpFF16gYh/sYUo+
	 quH1KZlEO0dDmJhlodR2t/aSsBxKhO0NZqAudTZLsq0d0d/eTJsHQBYVghEnF+RhM
	 DUwx4U6T2JSRvCT0+3rwvzsu5WwLJ7EN9E7Y3joDedLY6lxcJ5s9BR79BkpxPh91b
	 XQdtpvztdjJIXekUVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1vrCZ80fuj-00JEN7; Tue, 28
 Apr 2026 23:35:23 +0200
Message-ID: <6ca12124-7995-4ac6-bc21-657c65c0914a@gmx.de>
Date: Tue, 28 Apr 2026 23:35:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: Introduce Halo Box RGB LED driver
To: Mario Limonciello <superm1@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Leo.Lin@amd.com
References: <20260427022546.1407923-1-superm1@kernel.org>
 <44fec314-061c-4ed0-aa2d-9a25689f42ee@gmx.de>
 <6a956b60-6630-4e56-b171-f69f42258256@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6a956b60-6630-4e56-b171-f69f42258256@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PgfOIE2DNKP1eKzo5jZAxcblp3hAO1+Ol9n2VDi7aaPblzaRtdr
 WHs+VwQlE3HaAzLoRCEpfZ0hzJlU+V1llXGLfq1BGzI9RIDxoJjC3yQRi/BEki1ohazlEiW
 nGq2G2BqsHJ/jaeCvbMFXNRojOFxQazXaL+4Uu/0MAfZOGCBJJmX/C74P7aaJvohkHECht6
 IwcFitq/BVjy3f0793AoA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A0G/9qT/r7Q=;zGi/tGdHcg2Y8PoHHvmrMMxxedK
 URchAll6CgK4HLQcSO1GHqSKbOXFSichl1kCrbMR4/XDI4ip7ryiPqe0moUijLTMQ/d0+DHcJ
 BGovCg4L+eH3aQDYv6h9E/37CG5dQHi4p3QYANYahjlHJACOlZxWnLSBzGobRAAHuolepzVoh
 RchH2SCLPiEiqd3jcEd1C8PME6um75g7x++NPoAKR37aLIN7gehQOoV9VfzmDc1lQiYGifif5
 3YffMW8VdWd14kaGXCakQKQtbTH3ZKnDSj+dVF+PJksXupdVlCADg/iVDxwdIqjosyRQv6I16
 61QnQPY9SARnRR0rePT8iIEgtongeHsfGKLa+5pkY+AGX9qdIpL1D0za5kJke+9DbOhagk2J3
 bjhIkUXxnjFli1THAie3emPIrN9BMNV6iuq93IaXbGElc9vkwM82cgcYH4POFworMTp+WBuZ9
 kr98y8mczrIIBRItYOPvsAVf5J4ty2MlCY3KMuXeHot44BB252GbG6lwx8Bq5vU5NSgX/20/i
 J7cce7PZro5i2B59jLC+qbzEH/J1CgpvlxDZyybnBjCIonL8IeFsdNvUMFDdDCAVURPYIzoOX
 M3Bl549SJA+mJ8LzmT61zOiAIgqHvkd3LtTSeX7BolE6rPFGVQjqof6M9GY7YJsTB01VpDGR/
 2G4+a+zdglYRya7vi7vBHzvVz6OVuul0WndIHgi0Sq5N0nUWr90KJOUwHtQXwz/4uyFo8fyVa
 8r2XaFzC8YVj+PTbzvVJlG42oWoFubK9dgUf00HmqD9LzlUjX5mU499v3kVIEozRfdrydsJLQ
 yXDiLpymRmzeZlMoZmP0vM+oAVmbgxrJLQEbsoxnfcGcSf+klad9W3rgKjZ2wDMZ2wXC+rMNQ
 jQnqJXt8sk4fZ5g5Jfwkbd4sRublPQ3LjsZYHtHQKiWK17HvBqAKDPyHAYXyMq+ijSf8xyCZk
 rfFih6AymD4IpSw4ZOYHMGvReRvOnQ4tqzJO/CWx2OI9KQTh43JiWClzcr5FtZUzxLCTiaYBl
 rAxzHwy33AV0DjlZs0a+1Q8JWHelnRn7cRNuGPgEAsiJsd0i27n9nTX0H1I7Y1LSgeq+hYgKO
 IjtE4f7vXcy5dkQ8WpoFF9g4ZML392jBufwl+VnNvGN3KCp4qRbYf63ZPNurLZr+HBZnCdt4w
 MJSlekPorX7Vuy+C3uqCz5WIAtFft/1iYHBLPSbz0ADfk/rx1FMlFwpnIkyMwlPB6VUGXkFLs
 Qn4lD+8egNAafrSalaWOWTpN792BdFqiPCzubR1RZS7DL+IWx14NkXVmjxSC+nk0Ee3weUlth
 f/hj4KnIdGmQAgZlekukaIgcmW5V72EyDJWsg0DowFTziYZe+4dpERn306Q/+VwTd8nj0bo64
 h1Bs4yPyEFnrjghOCyM0UpQnZwlGjQcNklCR95SSKR0jk8/Xk3rJaep1haPDuxtY47Zz6ltcq
 XOtvXw/3v5nrouaQyv/uiwckt7rmxWgB8FswZ46HFEo8VLzPyuG73lpZcAXbhzbpwsi2LUaaj
 Sp+Di7PGREEdiAiRqI2gBBJMX6YTDaQ4nCHeLv9sEKcwYFs8/4vgQ+yVVSRZaduLzsu5sAh8J
 /6BeTkKtibtYpJ95yWxDWys5lOrdwfymMmQxbuNeaFFtApfMUUF7lbQWnEJkoglif15j293gk
 GvfWSVdbTpKRqjMAegOT7AhxmPLxpdh1pDMkVe6ER/xWL+/P3B/SL3i2KJcP++lUDQYWtC73J
 htWrhzg0r1jo9ToEOWFVCrP+F9ZYBpt3i/Vb94PyTPQg+5gzhW+AhE7uGbCSs7dCEA9xQkMBQ
 +tM86gFEDGaxaITWS60wCjRJEMhpJJFOPifz861HQP1nB+lJUTFBxfdjtVuShlhyfjPgbKurU
 BgOcqXKONcOf7wj+pLVQrebEcqx3Hu9IK3j4UnsnGTE9SuuRKA210LlSYyffsO4egZcF1Zz+i
 gu4D1cjEZHA7uv9GYu4bHr1okte5CJVT9JJVFfMDsVfw/2Lt3SLhZT0OOdPFUkMRFHNM2cGLP
 Gvffjb7/pjBDMQhqKlxuH6e9ECcEEdPuH7FVxyQjDEkm6c6fTSghX1cG6b7L3JsZFU77swv34
 v5VXuYtYiVf/aO+PdMjOZPoWm1KI86IK4/jw4Sp+Vfnpf0glMcsuzHabKNI6co5VZTgiipGTK
 3Q+Z+i5Kg1W72Dm6rTJ2NvLwhoeypRtIDgt80B6FLzFdJanmzLG1tTjfTcVyuT7G4uRapyhYL
 eVEcEN7wVB3p6MtX8RJch8ar8ZjQC/sxs54M+b4kATqYpA28eJR0Oo8X3QimQ0wV80uvhXU4o
 XtK64JTTwFeuLYBxsaln5qGEbHIroerJ9l27pWTFNc3YYoXgu1togcCkM0qZLcZHOHcI1Iz9P
 tSHgJYBTbTaBn1jUjIoCk2DckT2AI8LqcYPHBkbndsj75ktq9VJfgdNWt8oNUQzDH+eYjm0v7
 mkbjntu4L9CrUi+xurkyeezgObLFxwwxVLY7IoZ7dQou1Jm50mFzH4+J38zzLQ+roLOsy66Di
 +vkd6dsb2aBvNhfTLJMH8XDs4vYZubgzsU8S5bfZGLvrcAVXXQ+Bnq9LtG+3f94zG7B9twXfQ
 vBnH+hD/Kq7Si2dRKG06Rbra8BeBtSaFE8jwELhZ/9lG8MZA161j7AYhBwYihtf1IBp3/n34S
 4Q8mDUzL1KGj7rnPMjr4u4RfHnOiEQcGaYJh7f+D53ninY38nU7aFEsxv0oa/wP6hov4g1KOa
 wUj2jtHzYTely9L+377Icu6lqT2mOCpO7Gt1LrOUGt6yys0r3hH1aPUS6kiHOvvWSoQvmRiXn
 p1YS1eaJziC5r6r+03hDdz0yjKLm8cVVKCOtA2NFC93hKx00PHlX5biChUMowQOJHHXfSjrK7
 p+909gKudvR5iJJVd2qOETK5rvWHspah+uqBCY6Mno9UouQDVEMmWA5NdJ3m+luBDUCjF+wj2
 rAdMthXeIL/OWw26W4fM7bEyTb4leXXtNYneA0CCpOPlyh8EFZESk2C8gnewesYbCjNkawhdy
 FdbM/Q9C4mCWyVNmKO5HO9AmfbK9yn+0xFbcRkZqcLQ8/4gQMGabtvZbSW8pOCNQG7wDcwUOu
 hBA4EN3keCPGuLzVcuaq3v10UKMWhetJ2AKwcXVR9gjwlKsl2DPoo9JdFvBDP0InvFRqOgqMu
 bES6/es3yJJlq0e53cyc57A/RlJFmPjkTGAwibuWwmJFCafZcNe+IgZo2yF2LboREuGZaYVQo
 uADWzzkQbBVjiZp3DqcHGA4xeg9d8zSrWWSg1LbaT4Mb3fID83HJf5B1ByMckAC57eDmBZuCR
 Heu6SX3H1A1hmssTk7d8lmLl4qEnvyRnJgxJNbAcUoC99FXjGMnCYWR1kpv1h0DbWfK/Vjt2u
 gDjEYS61APCuu/xMchrjqrgTHMddbOlKOZ6Cn+Omt60TsBJ7lGAncWRaWTleWinsN+xZAJDFR
 Qknhj5vbwcAo9N1xK+tgS+hVk2N7AB9BceVzE/FYP5fz+2lRY9VVV3rtzlnLNb9fY43Ioa9ic
 INfe6eTJP3iE3iutqQ9B4LEXS5Bfs1sU7Mxmz81EnLB3kpd44Dwr+xmlTDEnLyqZdsx7zu3Pq
 MF1zREeAzf/BbUpS8qoHJdQp6kFkknCb4zcT62VePnxtZCgmTO0fOWlUQsGrXVXkpxILUnJVC
 P2X4ifCiqVfq3YEVO0fKW1cpdQbMp6hXjUPB3FRMsb+moQJWwUoY6xMRhcZX/voXeCL3/AuFd
 tdB6gxEFLCMX4AcY+dInq5cKtHc+8UZOvY5/SeP1x+nZ75QAYH05yvIdPr28X9h2XkqjrnixN
 qbnOdpkAh/tADUQKqxO3CmRtvG846Cg8JzFkDDI6j38ZRjpEa43zUXNDfzhiaI3Ynbl3BKh6R
 v0FKdITHQAdmeaiFe1eF3DSZ4DVU4qOBoiLe5TiVvvU6YlGRwRdK/whAOlr/2bwnJbzOeaPRK
 9foSl82WswoJ9S503TTFGrmAdH+A58tEyPpXwvQCvh338+ku+G92Qtck2W4/QySsKKkHVTGJy
 aBsSU3X6JSxgVjDqC/atWDfaNcGY1H5U6S8ZHoPSLmPWKIHartEg/thqk65K+3qrWnaCpN1en
 Kju6XIVOhwrr0KYlnOFcCsdL82Vj1bpCZorG9/b42RLbabYjdSxSxw3W1PcnUErCEzdSG9C+8
 OiTDxUl9KVHOoVYm+zyGxD+M88Gqsr5Y8JQAPmicAdRMTDC/qI1e1Xz1tmr0qeq5pIi69OQTY
 Ch+pSizULB1ia3BQPzCu/EDnWk85WBsJj3m/UEnF0kyEF1QoGF7HGe0hJuX/8VIXinaz0M5KX
 RYJM/eAPJBnf2t0F/vb83jGEtkujTzMIAvmk6QGjNqPVHrxc5JRlajgl7aGANQZj6gV241TEq
 tOLnXxH00bFSelc/ddLUhAL9u15JCEP8s3E+mQ/N+0hkDuMBc1/I3P6rA9WyXTcxgqI5PGbFq
 kJ6xqLdH63dO7BYpVj6iO73INjZpyXq5eyRWsZCRB7dSNPggE0DM0v8CB0XEi0UjqrwGdoZDM
 Hi1Mrgczx3jJ9SSgLOZapkyMQI1ZMAikkp3kd+Y8PEZn50EyC7reyBMs0iYo4CePa7Qy4Awrd
 UBdgvRD9SyKLOtXO9aDBUjHyXFFR7FPYNQxBOyUXcbM+hR9eGWnhO8NR9u6UBmLi9OdrBx6fN
 Wo82onO44QvFXkOZmwFDJTrjeXlhlOJ6RL30UtJld0TUHXAkUrAgdHrg21fBHZCYu25LCcB87
 jf10124K/0k///XeomLx6OzJ1d2sBfKjuGq+PUVkE0/AL5PTm3npKWzG0Vy/vv5bRRwfHSe+H
 s95GoQi8IDI0BhlaVqvwM+nngVCCEyZ6slRrbvbxtSpkmsJK4bRXkrnia2//clmSsom36Oz0X
 0zzRC+eoU+fZE3cZ1cvdIJhFgH+6bcXVVdfA7L5yHwfsVftXxPjJvbFtfOughlY1Ye0w33Fq4
 08RFqpWz/3Xl2x4nzKQYUESvz6w+kjH1MNPJYwwFMMIqdgYV7WYjPPRKeV6SKhVGt0Nmeq8tj
 XSN9v5+twkgPyv2fdKdh3Uh+4DgvJjLK8lDD+vcsHGgilFuRY+gaTkzHklRQ4Vri464IiWkAJ
 3SXBtgLpfHjsY/Mha5iwGGj5FfepTWmUWQc4xdB7rLwBpqLUBXvPf/kssMu/0r20Yi1SbIih0
 ZnIQHPzxISWU6Av9IDHL9joiM2kjDiBm/c15g0Dur1JGg8xO8CW1E+JOEoyWYkPFpu1xoERhF
 4JyJwyzHV6LfyjUMQO1ereJa0TYFc8B2jd4HgsWMVKj3cTMJ6y5h27PoqEa1lLUIFCvqCrNcc
 OwrQmyI4BmWfeWDzDMIBdx9r34IdmyQiAox3iotzUjwZxzVstYJiIYTdpcH1/wwAkFKQ4Rtyo
 5jME2I3J59rGwV/Q5z6hugfljNbxGiIwmPBzlopzWOTUQ9Rd/9Ew/AyRIiMoCcmmdh4zIsbXm
 ULxi91XVwXbhgwzxI+Ol7I6wIZMpD/w6dFgJAE60Mm5XKBSHf+tfqOw0mxFKgcKrvrfqryB2k
 geyeO6tSKAwO8e3xmYURlY2e2RV9LQrtxUsAbtKL8JC6NRdX

Am 28.04.26 um 23:26 schrieb Mario Limonciello:

> On 4/28/26 16:12, Armin Wolf wrote:
>> Am 27.04.26 um 04:25 schrieb Mario Limonciello (AMD):
>>
>>> The Halo Box features an RGB LED light bar that can be controlled
>>> through WMI methods to display any color combination.
>>>
>>> The driver exposes the LED through the LED multicolor subsystem,
>>> allowing userspace to control RGB values via sysfs:
>>> =C2=A0=C2=A0 /sys/class/leds/amd_halo:rgb:light_bar/multi_intensity
>>> =C2=A0=C2=A0 /sys/class/leds/amd_halo:rgb:light_bar/brightness
>>>
>>> Hardware interface:
>>> - Three separate RGB channels (Red, Green, Blue)
>>> - Each channel controlled via individual WMI method calls
>>> - Value range: 0-100 (matching hardware range directly)
>>>
>>> Co-developed-by: Leo.Lin@amd.com
>>> Signed-off-by: Leo.Lin@amd.com
>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> ---
>>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +
>>> =C2=A0 drivers/platform/x86/amd/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 12 +
>>> =C2=A0 drivers/platform/x86/amd/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 drivers/platform/x86/amd/amd_halo_led.c | 375=20
>>> ++++++++++++++++++++++++
>>> =C2=A0 4 files changed, 395 insertions(+)
>>> =C2=A0 create mode 100644 drivers/platform/x86/amd/amd_halo_led.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 2fb1c75afd163..c35b654a65041 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1124,6 +1124,13 @@ F: drivers/char/hw_random/geode-rng.c
>>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/crypto/geode*
>>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/video/fbdev/geode/
>>> +AMD HALO BOX RGB LED DRIVER
>>> +M:=C2=A0=C2=A0=C2=A0 Mario Limonciello (AMD) <superm1@kernel.org>
>>> +R:=C2=A0=C2=A0=C2=A0 Leo Lin <Leo.Lin@amd.com>
>>> +L:=C2=A0=C2=A0=C2=A0 platform-driver-x86@vger.kernel.org
>>> +S:=C2=A0=C2=A0=C2=A0 Supported
>>> +F:=C2=A0=C2=A0=C2=A0 drivers/platform/x86/amd/amd_halo_led.c
>>> +
>>> =C2=A0 AMD HSMP DRIVER
>>> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Naveen Krishna Chatradhi <naveenkrishna.ch=
atradhi@amd.com>
>>> =C2=A0 R:=C2=A0=C2=A0=C2=A0 Carlos Bilbao <carlos.bilbao@kernel.org>
>>> diff --git a/drivers/platform/x86/amd/Kconfig=20
>>> b/drivers/platform/x86/ amd/Kconfig
>>> index b813f92653686..d642386938055 100644
>>> --- a/drivers/platform/x86/amd/Kconfig
>>> +++ b/drivers/platform/x86/amd/Kconfig
>>> @@ -34,6 +34,18 @@ config AMD_WBRF
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This mechanism will only be=
 activated on platforms that=20
>>> advertise a
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 need for it.
>>> +config AMD_HALO_LED
>>> +=C2=A0=C2=A0=C2=A0 tristate "AMD Halo Box RGB LED Driver"
>>> +=C2=A0=C2=A0=C2=A0 depends on ACPI_WMI
>>> +=C2=A0=C2=A0=C2=A0 select LEDS_CLASS_MULTICOLOR
>>
>> I do not think selecting whole subsystems is a good idea. Consider=20
>> changing this
>> to "depends on".
>
> Sashiko also noted that you can't select LEDS_CLASS_MULTICOLOR withou=20
> selecting LEDS.=C2=A0 I think switching to depends solves it sufficientl=
y=20
> though.
>
>>
>>> +=C2=A0=C2=A0=C2=A0 help
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This driver provides RGB LED control f=
or AMD Halo Box devices
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 through the LED multicolor subsystem. =
The Halo Box light bar can
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be controlled via sysfs to display any=
 RGB color combination.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 To compile this driver as a module, ch=
oose M here: the module
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 will be called amd_halo_led.
>>> +
>>> =C2=A0 config AMD_ISP_PLATFORM
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "AMD ISP4 platform driver"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on I2C && X86_64 && ACPI
>>> diff --git a/drivers/platform/x86/amd/Makefile=20
>>> b/drivers/platform/x86/ amd/Makefile
>>> index f6ff0c837f345..2f467dbbfc8a3 100644
>>> --- a/drivers/platform/x86/amd/Makefile
>>> +++ b/drivers/platform/x86/amd/Makefile
>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +=3D pmc/
>>> =C2=A0 obj-$(CONFIG_AMD_HSMP)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=3D hsmp/
>>> =C2=A0 obj-$(CONFIG_AMD_PMF)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +=3D pmf/
>>> =C2=A0 obj-$(CONFIG_AMD_WBRF)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=3D wbrf.o
>>> +obj-$(CONFIG_AMD_HALO_LED)=C2=A0=C2=A0=C2=A0 +=3D amd_halo_led.o
>>> =C2=A0 obj-$(CONFIG_AMD_ISP_PLATFORM)=C2=A0=C2=A0=C2=A0 +=3D amd_isp4.=
o
>>> =C2=A0 obj-$(CONFIG_AMD_HFI)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +=3D hfi/
>>> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/=20
>>> platform/x86/amd/amd_halo_led.c
>>> new file mode 100644
>>> index 0000000000000..01b4583ca70f3
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/amd_halo_led.c
>>> @@ -0,0 +1,375 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * AMD Halo Box RGB LED Driver
>>> + *
>>> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
>>> + *
>>> + * This driver provides RGB LED control for AMD Halo Box devices=20
>>> through
>>> + * the LED multicolor subsystem. The Halo Box light bar can be=20
>>> controlled
>>> + * via sysfs to display any RGB color combination.
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/led-class-multicolor.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/wmi.h>
>>> +
>>> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
>>> +
>>> +/* WMI method IDs from MOF */
>>> +#define AMD_HALO_WMI_GET_LIGHTBAR=C2=A0=C2=A0=C2=A0 0x01
>>> +#define AMD_HALO_WMI_SET_LIGHTBAR=C2=A0=C2=A0=C2=A0 0x02
>>> +#define AMD_HALO_WMI_TURN_ON=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x03
>>> +#define AMD_HALO_WMI_TURN_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x04
>>
>> Hi,
>>
>> can you use an enum for that? Also i suggest you create a small piece=
=20
>> of documentation
>> under Documetnation/wmi/devices so that future developers understand=20
>> how this WMI device
>> is supposed to work.
>
> Sure, no problem.
>
> I guess in the future you envision decompiling and parsing the BMOF in=
=20
> kernel and this can be cross referenced, right?

Yes, i already wrote a python tool for this, but it needs some more work :=
/

>
> If you have a specific schema that you want it put in LMK.
>
Not really, you can use the existing device documentations as a reference.

>>
>>> +
>>> +/* Channel selectors for Arg0 */
>>> +#define AMD_HALO_CHANNEL_RED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x01
>>> +#define AMD_HALO_CHANNEL_GREEN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x02
>>> +#define AMD_HALO_CHANNEL_BLUE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x03
>>> +
>>> +/* Status codes from spec */
>>> +#define AMD_HALO_STATUS_SUCCESS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x0000
>>> +#define AMD_HALO_STATUS_INVALID_PARAM=C2=A0=C2=A0=C2=A0 0xFFFD
>>> +
>>> +/* Brightness uses 0-100 range */
>>> +#define AMD_HALO_MAX_HW_BRIGHTNESS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 100
>>> +
>>> +/**
>>> + * struct amd_halo_led_data - Driver private data
>>> + * @wdev: WMI device pointer
>>> + * @led_mc: LED multicolor class device
>>> + * @subled_info: RGB channel information
>>> + * @lock: Mutex to protect WMI calls
>>> + */
>>> +struct amd_halo_led_data {
>>> +=C2=A0=C2=A0=C2=A0 struct wmi_device *wdev;
>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc led_mc;
>>> +=C2=A0=C2=A0=C2=A0 struct mc_subled subled_info[3];
>>> +=C2=A0=C2=A0=C2=A0 struct mutex lock;=C2=A0=C2=A0=C2=A0 /* Protects W=
MI method calls */
>>> +};
>>> +
>>> +struct amd_halo_wmi_args {
>>> +=C2=A0=C2=A0=C2=A0 u32 arg0;
>>> +=C2=A0=C2=A0=C2=A0 u32 arg1;
>>> +};
>>> +
>>> +/**
>>> + * amd_halo_wmi_set_channel - Set a single RGB channel value
>>> + * @wdev: WMI device pointer
>>> + * @channel: Channel selector (1=3DRed, 2=3DGreen, 3=3DBlue)
>>> + * @brightness: brightness to set (0-100)
>>> + *
>>> + * Return: 0 on success, negative error code on failure
>>> + */
>>> +static int amd_halo_wmi_set_channel(struct wmi_device *wdev, u32=20
>>> channel,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 brightness)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct amd_halo_wmi_args args =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arg0 =3D channel,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arg1 =3D brightness,
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 const struct acpi_buffer input =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .length =3D sizeof(args),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pointer =3D &args,
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFF=
ER, NULL };
>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj;
>>> +=C2=A0=C2=A0=C2=A0 acpi_status status;
>>> +=C2=A0=C2=A0=C2=A0 u16 result_status;
>>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Validate input per spec */
>>> +=C2=A0=C2=A0=C2=A0 if (channel < AMD_HALO_CHANNEL_RED ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 channel > AMD_HALO_CHANNEL=
_BLUE ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 brightness > AMD_HALO_MAX_=
HW_BRIGHTNESS)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 status =3D wmidev_evaluate_method(wdev, 0,=20
>>> AMD_HALO_WMI_SET_LIGHTBAR,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &input, &output);
>>
>> Please use wmidev_invoke_method() instead. Take a look at=20
>> Documentation/ wmi/driver-development-guide.rst
>> on how to use this new API.
>
> Ack.
>
>>
>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(status)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev, "SetLi=
ghtBar failed: %s\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ac=
pi_format_exception(status));
>>
>> Please remove dev_err() here, the return value is enough.
>
> Ack.
>
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Parse return buffer per spec: Bytes[0:1] =3D St=
atus */
>>> +=C2=A0=C2=A0=C2=A0 obj =3D output.pointer;
>>> +=C2=A0=C2=A0=C2=A0 if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj=
->buffer.length=20
>>> < 2 ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !obj->buffer.pointer) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev, "Inval=
id return buffer\n");
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 result_status =3D obj->buffer.pointer[0] |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (o=
bj->buffer.pointer[1] << 8);
>>> +=C2=A0=C2=A0=C2=A0 if (result_status !=3D AMD_HALO_STATUS_SUCCESS) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&wdev->dev, "WMI r=
eturned error: 0x%04x\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
sult_status);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>
>> Please model result_status as a __le16 and perform a pointer cast
>> from the buffer (after the size check of course).
>>
>
> Ack.
>
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +out:
>>> +=C2=A0=C2=A0=C2=A0 kfree(output.pointer);
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_wmi_get_channel - Get a single RGB channel value
>>> + * @wdev: WMI device pointer
>>> + * @channel: Channel selector (1=3DRed, 2=3DGreen, 3=3DBlue)
>>> + * @value: Pointer to store the read value
>>> + *
>>> + * Return: 0 on success, negative error code on failure
>>> + */
>>> +static int amd_halo_wmi_get_channel(struct wmi_device *wdev, u32=20
>>> channel,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 *value)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct amd_halo_wmi_args args =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arg0 =3D channel,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arg1 =3D 0,=C2=A0 /* Rese=
rved */
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 const struct acpi_buffer input =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .length =3D sizeof(args),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pointer =3D &args,
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFF=
ER, NULL };
>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj;
>>> +=C2=A0=C2=A0=C2=A0 acpi_status status;
>>> +=C2=A0=C2=A0=C2=A0 u16 result_status;
>>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (channel < AMD_HALO_CHANNEL_RED || channel >=20
>>> AMD_HALO_CHANNEL_BLUE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 status =3D wmidev_evaluate_method(wdev, 0,=20
>>> AMD_HALO_WMI_GET_LIGHTBAR,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &input, &output);
>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(status))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>
>> Same as above.
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 obj =3D output.pointer;
>>> +=C2=A0=C2=A0=C2=A0 if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj=
->buffer.length=20
>>> < 3 ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !obj->buffer.pointer) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 result_status =3D obj->buffer.pointer[0] |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (o=
bj->buffer.pointer[1] << 8);
>>> +=C2=A0=C2=A0=C2=A0 if (result_status !=3D AMD_HALO_STATUS_SUCCESS) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>>> +=C2=A0=C2=A0=C2=A0 }
>>
>> Same as above.
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Value returned in Byte[2] per spec */
>>> +=C2=A0=C2=A0=C2=A0 *value =3D obj->buffer.pointer[2];
>>> +
>>> +out:
>>> +=C2=A0=C2=A0=C2=A0 kfree(output.pointer);
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_wmi_turn_off - Turn off all LED channels
>>> + * @wdev: WMI device pointer
>>> + *
>>> + * Return: 0 on success, negative error code on failure
>>> + */
>>> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct amd_halo_wmi_args args =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arg0 =3D 0,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arg1 =3D 0,
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 const struct acpi_buffer input =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .length =3D sizeof(args),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pointer =3D &args,
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFF=
ER, NULL };
>>> +=C2=A0=C2=A0=C2=A0 acpi_status status;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 status =3D wmidev_evaluate_method(wdev, 0, AMD_HAL=
O_WMI_TURN_OFF,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &input, &output);
>>> +=C2=A0=C2=A0=C2=A0 kfree(output.pointer);
>>
>> This looks strange, does the WMI method return any data? If yes then=20
>> please perform error
>> checking, otherwise use wmidev_invoke_procedure().
>
> Will double check.
>
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ACPI_FAILURE(status) ? -EIO : 0;
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_brightness_set - Set LED brightness and color
>>> + * @cdev: LED class device
>>> + * @brightness: Brightness value (0 =3D off, >0 =3D on with color)
>>> + *
>>> + * Return: 0 on success, negative error code on failure
>>> + */
>>> +static int amd_halo_brightness_set(struct led_classdev *cdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum led_brightness brightness)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *mc_cdev =3D lcdev_to_mccde=
v(cdev);
>>> +=C2=A0=C2=A0=C2=A0 struct amd_halo_led_data *data =3D container_of(mc=
_cdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amd_halo_led_data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_mc);
>>> +=C2=A0=C2=A0=C2=A0 u32 red_hw, green_hw, blue_hw;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->lock);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (brightness =3D=3D 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return amd_halo_wmi_turn_o=
ff(data->wdev);
>>
>> I suggest that you update the RGB color first, otherwise the LED will=
=20
>> return wrong RGB values when
>> turned off.
>
> OK thanks.
>
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 led_mc_calc_color_components(mc_cdev, brightness);
>>> +=C2=A0=C2=A0=C2=A0 red_hw =3D mc_cdev->subled_info[0].brightness;
>>> +=C2=A0=C2=A0=C2=A0 green_hw =3D mc_cdev->subled_info[1].brightness;
>>> +=C2=A0=C2=A0=C2=A0 blue_hw =3D mc_cdev->subled_info[2].brightness;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Set each channel individually - 3 WMI calls req=
uired */
>>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_halo_wmi_set_channel(data->wdev, AMD_H=
ALO_CHANNEL_RED,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 red_hw);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_halo_wmi_set_channel(data->wdev, AMD_H=
ALO_CHANNEL_GREEN,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 green_hw);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return amd_halo_wmi_set_channel(data->wdev, AMD_HA=
LO_CHANNEL_BLUE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 blue_hw);
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_brightness_get - Get current LED brightness state
>>> + * @cdev: LED class device
>>> + *
>>> + * Return: brightness last set by the user, or=20
>>> AMD_HALO_MAX_HW_BRIGHTNESS if
>>> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it was set by BIOS=
, or LED_OFF if all LEDs are off.
>>> + */
>>> +static enum led_brightness amd_halo_brightness_get(struct=20
>>> led_classdev *cdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *mc_cdev =3D lcdev_to_mccde=
v(cdev);
>>> +=C2=A0=C2=A0=C2=A0 struct amd_halo_led_data *data =3D container_of(mc=
_cdev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amd_halo_led_data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_mc);
>>> +=C2=A0=C2=A0=C2=A0 u8 red_hw =3D 0, green_hw =3D 0, blue_hw =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->lock);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Read each channel */
>>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_halo_wmi_get_channel(data->wdev, AMD_H=
ALO_CHANNEL_RED,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &red_hw);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return LED_OFF;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_halo_wmi_get_channel(data->wdev, AMD_H=
ALO_CHANNEL_GREEN,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &green_hw)=
;
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return LED_OFF;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_halo_wmi_get_channel(data->wdev, AMD_H=
ALO_CHANNEL_BLUE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &blue_hw);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return LED_OFF;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (mc_cdev->subled_info[0].brightness =3D=3D red_=
hw
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && mc_cdev->subled_info[1]=
.brightness =3D=3D green_hw
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && mc_cdev->subled_info[2]=
.brightness =3D=3D blue_hw) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return cdev->brightness;
>>> +=C2=A0=C2=A0=C2=A0 }
>>
>> I do not think that this is a good idea. Maybe you should initialize=20
>> the brightness values
>> during probing and just not implement brightness_get at all as the=20
>> hardware seems to have
>> no possibility to read the global brightness.
>
> It's mostly an BIOS/EC issue.=C2=A0 The initial state value when the sys=
tem=20
> boots from S5 is wrong.=C2=A0 But if you go into s0i3, reboot, or s4=20
> everything is fine and state is correct.
>
As long as you cannot read the gobal brightness, brightness_get() should n=
ot be populated.

> That's why amd_halo_color_set_default() existed.=C2=A0 Will fold that in=
to=20
> probe.

Sound fine to me.

>
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 mc_cdev->subled_info[0].intensity =3D red_hw;
>>> +=C2=A0=C2=A0=C2=A0 mc_cdev->subled_info[1].intensity =3D green_hw;
>>> +=C2=A0=C2=A0=C2=A0 mc_cdev->subled_info[2].intensity =3D blue_hw;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return AMD_HALO_MAX_HW_BRIGHTNESS;
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_color_set_default - Set LED to initial color and=20
>>> brightness
>>> + * @cdev: LED class device
>>> + *
>>> + * Sets all RGB channels to 20% intensity as an initial state.
>>> + *
>>> + * Return: 0 on success, negative error code on failure
>>> + */
>>> +static int amd_halo_color_set_default(struct led_classdev *cdev)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct led_classdev_mc *mc_cdev =3D lcdev_to_mccde=
v(cdev);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 mc_cdev->subled_info[0].intensity =3D AMD_HALO_MAX=
_HW_BRIGHTNESS=20
>>> / 5;
>>> +=C2=A0=C2=A0=C2=A0 mc_cdev->subled_info[1].intensity =3D AMD_HALO_MAX=
_HW_BRIGHTNESS=20
>>> / 5;
>>> +=C2=A0=C2=A0=C2=A0 mc_cdev->subled_info[2].intensity =3D AMD_HALO_MAX=
_HW_BRIGHTNESS=20
>>> / 5;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return amd_halo_brightness_set(cdev, AMD_HALO_MAX_=
HW_BRIGHTNESS);
>>
>> Please fold this into amd_halo_probe().
>>
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_probe - Driver probe function
>>> + * @wdev: WMI device
>>> + * @context: Context data (unused)
>>> + *
>>> + * Return: 0 on success, negative error code on failure
>>> + */
>>> +static int amd_halo_probe(struct wmi_device *wdev, const void=20
>>> *context)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct amd_halo_led_data *data;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data =3D devm_kzalloc(&wdev->dev, sizeof(*data), G=
FP_KERNEL);
>>> +=C2=A0=C2=A0=C2=A0 if (!data)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data->wdev =3D wdev;
>>> +=C2=A0=C2=A0=C2=A0 mutex_init(&data->lock);
>>> +=C2=A0=C2=A0=C2=A0 dev_set_drvdata(&wdev->dev, data);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data->subled_info[0].color_index =3D LED_COLOR_ID_=
RED;
>>> +=C2=A0=C2=A0=C2=A0 data->subled_info[1].color_index =3D LED_COLOR_ID_=
GREEN;
>>> +=C2=A0=C2=A0=C2=A0 data->subled_info[2].color_index =3D LED_COLOR_ID_=
BLUE;
>>> +=C2=A0=C2=A0=C2=A0 data->subled_info[0].intensity =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 data->subled_info[1].intensity =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 data->subled_info[2].intensity =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.led_cdev.name =3D "amd_halo:rgb:light=
_bar";
>>
>> I think the lightbar could be viewed as a status LED, so=20
>> "amd_halo:multicolor:status"
>> would be more suitable here. This would also mirror the=20
>> uniwill-laptop driver.
>
> OK.
>
>>
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_=
HW_BRIGHTNESS;
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.led_cdev.max_brightness =3D AMD_HALO_=
MAX_HW_BRIGHTNESS;
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.led_cdev.brightness_set_blocking =3D=
=20
>>> amd_halo_brightness_set;
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.led_cdev.brightness_get =3D amd_halo_=
brightness_get;
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRE=
SUME |=20
>>> LED_RETAIN_AT_SHUTDOWN;
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.num_colors =3D 3;
>>
>> Please use ARRAY_SIZE() here.
>
> OK.
>
>>
>>> +=C2=A0=C2=A0=C2=A0 data->led_mc.subled_info =3D data->subled_info;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_led_classdev_multicolor_register(&wde=
v->dev, &data-=20
>>> >led_mc);
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return dev_err_probe(&wdev=
->dev, ret,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to register mu=
lticolor LED\n");
>>
>> Why not using devm_led_classdev_multicolor_register_ext() here?
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D amd_halo_color_set_default(&data->led_mc.l=
ed_cdev);
>>
>> Please do this _before_ registering the LED device, otherwise=20
>> userspace applications might
>> have already set a RGB color themself. Failing to set the initial=20
>> hardware state should also
>> result in probe failure.
>
> Thanks - yeah this was something I noticed raised by Sashiko as well.
>
>>
>>> +=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_warn(&wdev->dev, "Unab=
le to set default LED intensity=20
>>> through WMI: %d\n", ret);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static const struct wmi_device_id amd_halo_id_table[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 { .guid_string =3D AMD_HALO_GUID },
>>> +=C2=A0=C2=A0=C2=A0 { }
>>> +};
>>> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
>>> +
>>> +static struct wmi_driver amd_halo_driver =3D {
>>> +=C2=A0=C2=A0=C2=A0 .driver =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "amd_halo_led",
>>> +=C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0=C2=A0 .id_table =3D amd_halo_id_table,
>>
>> Please set .no_singleton =3D true here.
>>
>> Otherwise the driver looks good to me.
>
> Thank you very much for the review.
>
Thank you for contributing this driver :)

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf
>>
>>> +=C2=A0=C2=A0=C2=A0 .probe =3D amd_halo_probe,
>>> +};
>>> +
>>> +module_wmi_driver(amd_halo_driver);
>>> +
>>> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
>>> +MODULE_AUTHOR("Leo Lin <Leo.Lin@amd.com>");
>>> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
>>> +MODULE_LICENSE("GPL");
>>
>
>
