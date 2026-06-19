Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4864964F
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jun 2026 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781898587; cv=none; b=pYjIZj51EZylT0eLn5ks5xEnLNO0gYilQEEJD7d00nSKGK6/koN32YaWvLBOAuo4SmtWeAtlgmyMOUGB2Li8jULzcdBOc58jT6TPsGjaN8BBxqvxpnoGCWwbQxvIWp+i2gKUYPrO7LqDnDm16jFiqnuu5Jawe7ogQl0YgcBlGBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781898587; c=relaxed/simple;
	bh=GyYEDr4uMBijefqGZ7adswwJvNpcE2RjZNtlt1frvrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KlPIE3Jx77sbk+G8oxnrVwKT6cSMFUyTyDFkn9B2XVGnZPYxT8qaQLo+tqM2vqArOGBTL6mYjXDyNAmwM8XZYegDoSEyMVjylphuLr1FeP11AZQq084gevxurfbqeea2CJLkGl1DDrhTpfbmI7n0JiziRnGV9vsbE+d4iXUtW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hBK1UUTy; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hBK1UUTy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781898571; x=1782503371; i=w_armin@gmx.de;
	bh=FBP84Hrhnvwyxm9fqk2Dh6B4ojSV1En1EsRrJdeuGYM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hBK1UUTyCuIK0uXEccLg6Pkx07tJkLgEn5CT4DKd7Sy+bDk/XD+mLedLwbGcTSiP
	 mFUx4hk3rIM2g4uFKE0zI1Z+lalUXrKgJJ+X7F+m1DEc/6cNmCxGJ3Dh5ywENuwBq
	 6FoL2baneN3vuCOZ2N3qzKP6FUYyf72ZGbGbP8x5NaU9n5TCug5USlCElVfJRIuQU
	 5RUko28Pi4quUSquDdXEzlKiaxFzF1GOYlro0cQ8ZgZxscZE1WOJc7XHcJllPV7wN
	 qLzfW44qrKGW7vX7O0IoTLC4VnVQHyyY2vqfvjvPvPN5XqV33C722d9Ma1EwGRzNq
	 ozZ9csD48Vl2fOsYAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQic-1wRLYr1y10-003W3m; Fri, 19
 Jun 2026 21:49:31 +0200
Message-ID: <9903d72c-bb7c-4ddd-88f3-31422c0c2cde@gmx.de>
Date: Fri, 19 Jun 2026 21:49:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock
 detection driver
To: Dave Carey <carvsdriver@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
 Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20260610155340.342949-1-carvsdriver@gmail.com>
 <20260616143508.124122-1-carvsdriver@gmail.com>
 <20260616143508.124122-3-carvsdriver@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260616143508.124122-3-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SlooIA8RoT3g5ecDxzraW/u2G6PFGIDpSodKdBmhHPV80JjTWzg
 tY95MyeZBEVW30/nuY1ZL3PzRV4rdbVaF6QwjU9z7awHidPcvZf73r/L+SD9XrgIAG+CR24
 aHn691gHBA7cb1fJ0dYsrJ9w3ET6WD77KIoGZXaMjzc6msnXqhU+Q+fxB7epyLJmLi4+/sw
 nsyqdi8RwOzNR5WALpLsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2cHLv607hAk=;PHjxEAdzVTnm6uoWlLG/owh988j
 c7sqKaFtgoQfvF9TWfC80NFIlnNb5rbX0r+Z2OqR7g0mP8Epxn9VkaOOzn74XncJItJRnsg90
 GE5h4WrWDdGp0IEqaXPwRyJfZdKXZUkiq1YX0+so8yNanuxhKZuEkMXW/SxvKRzQaE/OGiG5J
 +BdNcZmRExDrHUrXmfPRC7+qnH55I2reunCO/ilIKL74H8+86iJbcwrI5/LUu1JqNVMp6Gd04
 ZCsBVK16LcsamF5GUZnGlZAXf6s2P9R8/k6vyDc6IQx8UVZomXEHHLxJIJL2L3b20NGf5KsZZ
 rcAGf2i6QVkQqHGXCbKjDZ7rAnsdnGIOiEGHSncsQvNZ35+GWZ2bXsVW9GbcWCMw2PMdb6DrR
 XD39vCQJifFMjp7k8lwhEsrNg0S4N3LSYWVWKavfXw8X5z0j0NmlSeY+/8ri6U7uce9YC+UPC
 rEwfDqq68TFm+D9e+KG6Dv2CeKG82uWnWfSt+YtqD+kL5p8kNPnia/UCDukOVI2yb8wNiCzLv
 XCX0PSyYSdAnulOlHQhJfL+5omjoXxurOdvkkl6YTxr9tVh1b9LJejQC0KQShaISGX25vp7N0
 sk3RKfu8J+hdMTVzLAE/oVetwjHL001/ooIgJpsmw/kUPwW8b7Ec6gZNsFDakCmOWU+OjfyzZ
 K+uE7RYqltIBcxWh7CgPJBMEyfQY4JJYoCUi4fllHluFAIzLTwABJWobJOCgF3/kmX0RYjG8W
 52Y43Mo0Pa66aOKRwDffbjRIWN2/oCB8JK5dQyxlczvv4ET7zkMepx+82lAAgZqD/7rntT/Kh
 nX8GMhcAhxpRJO8tuIv8m+xTQxLNi6r07Uze8iISisM4elEogcZ/TVWUD3La+ijp2CpV3iNXo
 JdXREWw6lm3byu/t2ye6AAxUnqnDFlP4zeAeDzyHW+qvJoB4AsSnzcvD/oasBOQ7IS7V23zSe
 vp67AsvAVS3FBOnB6d6j7f2T8tqcp3ibCOZRZy1jZt4nZ4wBme1XAat3tpdFawQwgczx07cLd
 G5LvJx7fpZwJC4pOLHtTudtE+by0yoxx6p4I2A8300lBWOJWsIgPd1TZvTYksfeIuPISuBpz6
 FnhiPOLxxhLcwbhAkRmaPxmiE+xkwib14QQBltRU6FIr70PSZBcksZQQjL/ANHGxrmnWzgury
 ce6pGanFPuiW19/zJnGSM2FNySaZoYQRhX/xpUZ6bdrHhRyS0PPFOXoeSV/3UNKBp74Tjlocy
 48OLRViq0wO6aGVC7Sty+Sh794GlaI2orA5NJW/y2VVKqJgftq1HS7STlZpSV4iXT0tFF+jnM
 EkdscWUZIkZxrJrJVWWQrbl8+jh8s3xzBL31oDNXy5VaMSkOJGbDlbkl6Wpm3ezmCPBrfFGZE
 q5WINcrN+mW3cI+YXdYpesIMb3NA+Y/8BJQIdvPRf+8Rv/8WEhDlpyDulSorrn/OTDs6wZpkq
 HklPjDdSA2v6QuWTZ0lW/tznTJlZv7Slo4voel3vqKHp9jqk4C7vMFx8H3hYau7enavYns1J2
 eoSCIQFTF46EyHzKOXdpMkWZX6VFxU4ZI+GqGMCjJTsoO/mV/63AuI4WJim5eCMCc3kzXAUdm
 3Yl82CrBUXtNISFWa1DEyBkbTCASRGIoDsEyC6q4Qb47G41Tv7gOX9pTM/ggAudQq5qwFyN3+
 ZMe+Uye1UfoumFa2tUhF8+HgwHoP3q1j/L52HN4eu/uQtxpFdq5RHFe6lA+NQzJ43lNT49Drv
 5MhKReFheMAPVVtzqFqmK9A64S6sIeqsNZL5LZk5sBx0duCkTjgderTv+PiDj1WeXwkAUejje
 P5BZgbROdXSqBooV+b1sHMHqWnM5/vUMYT6eucc2XVVYXOygrdjGaCX/FMlwiy+VB/41JDYEr
 suJFR6vj5N1SCixJ1NT8C5F6XuGdEXawqGXoX6Zia60rqqEW5O3dt+Ie+CttiNpb959QVyh8b
 K/GyY209GcEbqGk6b5tCUqaPCm9bdlut5iZhA5c7cTQ78Vyk1Q56g8dYc43kPvSl9r/GDJch5
 GTtULYu4qzc9WtZfce2fAZHPpS22unSRMAOSYODXcigHvcu5FAK8rR4I58ydWbRgY+dyKBnd0
 ofd+PJ3vRTMd5xRpl2ac88onB9ZoWqcAE3PPE69f6Y1Obk+yEWkvfRZ+ix0IveUdJfpakrOqx
 2UE11f4ideQjLHkKJ+3bZZtqVyRdtmpko5L6wiMo+NSPiw6s+OCxZxW555dJ3+pZGcIMZdm0b
 RM2S01f24bMnjXHInk/3ipvr3eKKcEyxf+M/kj4iQa04U5ulzwCzCqGf0B2c77kMsTqPNpFt2
 f8Et2ShnmIEv4NudLzS/7RQVC29pBixPcu+Ysxgng5e0MIFv00qVrTMy9VkNwJYy5ErfxSAum
 3M+q56xg7+aJ6DtMSyvEelt4FmfZTDytA0bx8UIIWpv+qqtrBYOLiIUX5YkKi/x9ef8bM8zCO
 VYh6sLe/Wn9mIEBQPLfPQt/Z6xcya2EObT40/oNFqfqm9vz3zs90vVJJBu6W9K1IZu99WbV/+
 ScmUQXYJSBsaY9hlckW+Y1jcKju95JyaSGVFOCUDopP1RU9tA4Q02xGw4wQO2CgHLeJs/0wwB
 XGH7j1PpaLYWoWTUw5UAJdTLjNbDZFH5tkg+eTNlJJOZHaXJmEC68pnmzDdPJ6gIrinM1OADD
 4LHenuFBqa2Nc49J3oxnHPrlTbqsXjszQ9ElDLsAb6/UblHKN8i+4SmCokoemj2oM4iSQJoX9
 MlGoKre03kxik5Net2exaKkkPOC1UCOzD4xUWF0SHG9EOP3SzUHgE2k4keQD4fXNgPo1bf/g8
 p2d8/FFubaw45QFdF8GOegVksMU5nuCIXkcrLPLc7FYOqr4Pwf37CgWdpNlIA2fgXD+fwL0ps
 QlTYMw10pwd42ctbVS2hqHwvIleprMj9Im/NvezwZMv2P2APSBp2ix7JeRXK97mFqDkXoF1jD
 mFrjsDlbPh+J00D/QmwrHSion6H7KY/GnSk2D7/H+Z2aC5oNtBlDSEDxJ/7jSNMO/+D9weRrT
 ku1SJjimOvbOEVMr8pQmuBtoZppOscoraM3GHtzmoIw0UKzkgwMQtn5+o6srN1SB/m5lZ3k7V
 9oNkj/VjY+/JdJO3SCVYgzOLctlFSgqhBLZ9wTi6S1LufYKrbpzJNQClQYZ3yKyPvSyKrlZr/
 U9C7+F+U+0VYGm9HhnZb1YzeeaLcj5WmTGBXSaTCei+0jyUzdNYGYO9+UIDq1DXp0+EDOh1gS
 uG4mahE0O6F+ocE6EGOf7hemsF93HBY207mbNQs7AWecnvveP1D56O3UWEt1PIi8fEWK2Ei0W
 /6UPs6LGwUab8oWsxLHtZn8bs/r9undI4Z7ryo68FSgSmxH9I2uJd5anuupKaQ/nPSBLIx4Cy
 aEnsGEI9Na/mSVZNUREBxa9iANuXR7DDC56i0cVcdnRcnaUTCIKpIvX465DxMFJaSQvoZ51uo
 +rl1j5wmP4WAVtowUnnjLTKLK2SPmzcQI9DitGrME76vBe8cMdrS6KStrwn4xvnNNsBp8SThA
 0YBX02qOJ+lBmym/3R1oEcDFm/C9GIEQP8EXkZBUW1PBL/wKJ2Dt4lxQnmQV2//51DsZdL2io
 0so3fnf0dWiK4l4zNAgVn8EiLFux7clVLum0MAD/z/mguApmB98PDGZQOZ3bPe/HrR95uDsGf
 7gvySPpJ9SOa4mTSfR4X7uVzntfiG8LdOhgQzQO2/mBJCjTHtty8HWZPFbKGWWx/hjSh3+poZ
 x110qVdquo1gg6bLl06rIIAuldmVo2UXC5yiHW7PGxlxhk5IJHiWhiEuWip19vuHMwR/iA4jZ
 czZL/JPGdvn9u0/BSDnz6cdgU/xqyXnkOeq0/pKpcbUfxDothdmvpQ9gTcEZ88FJCdHJayGf7
 D1pmDz+mMXYp4NQmVInUCwfy6aVxuWOp3zTq9p3YrwijIu0hSFYWcwVIwwtK6DoogSvN6enn+
 htkRsr6Rj5w+C/xE6T4hK75+jtYyax6cBvrUkNFEuh4aAwdXSwU4cDXV917NUbiDHZwd0p5LD
 BQFtDNSfTgg7PV4nmPiKEdgchEEQOGQYSiaUTLPgzWxQLKutcWeXF1eTQ/YyHaCuv+dUAI4Ir
 Vke5XRKYR9E5/iuhhvHTxoW/IPfZkojG75BsEu3TbhSX3m4cKZv3tVIQ1r88c99O4xYJ0mCob
 +SwAkKCU56HRmMcetxHIY+eGaPYrQKTkbRCmU+NFwm8Gra4sStsmTkPe3PQiYGRgL5I2umztw
 EzqksDvc8c1fCae91nCp46DNl9f84uNf4aAisuK/vqTwzC7BDa6bN4BwiLWEC3oI9jyApGn8W
 8UcQSGgyWymhYJbMkm591ShVeJksSiKUl6Bdwp1DXdqp9kbVedYN4BoX2VQLaBXj9k3+DFYin
 ke88ppo6L4QjSU8ng45BDcYqjjDk0PDdllhJb3OYVXGymZVQSyv7KrGM8KMBN4KAIQmkXSkrQ
 ZracVi8hLkJjw1Os+GrbhAZN0lTpXlnnYN4wZ0oZtu7N8e1IMFf0uoFbRZOXHJgc24YMhG4sC
 Nf4BIWQKkKHJVH8zmg7sK8rjpAQlL9lMhGIYRuo7IwujXZ7Wb/L0e5EgZ2INmhbtSj8cvhHOY
 68ITBXkEkalNGrDLFTKH9WqtNb/nZRGP0HZJ54yshhWtVTie4I+a1/1LKJD1eBMQODzy5O8t7
 7HgvYwm6oswhr1//7wQqySt0bwBFrsBCMiJ3qSkEbnY2vXLKwjDcPZ8eLl0014Iy08F9hnH7j
 Jzq1QMdA7Q743L6ZLOOe5yVGtbEwb0wmVWBEnNh5U13bmaAjWvZJxmQ7BGU6h9aDxm2lGLe06
 I8qWDpx+6uqQsPjvEobUF09WBK/2XQFyP35ZyornOsi94tUvYmfKUz40l4EAYYDKlrlzJIz/J
 btF0s823sClTPAbUVMfRj6O/J4i823p24qmHpecuVTyZuox4BwtZysXUliEwfUlcyZMKEj0CO
 Q+0k9SzzkCCWk21wj75xDZ+ZJvm4GBDvYljy8BAcVsA0hof8zgXAZRqfhQTWoymC0B1Pc9IYW
 N7MoRhQe21ycPoqQCUYXgIgkpMPQ3dpLI88ZCwJWyIH9tKiSMVLeopAOhRVmxqAs1uJhNihG1
 mH1Gcaa2J7VOIojBL10DmR86LZvUMq4doyagG3EBIhyAw8lqqyiISwtFlKEbfO0/DqbPBW+pF
 s5xyZZ8GYeIDIMR4EcoXThqBdkDSD1dTywauJCmK2JqVi50ALIz/y2psYYlbEOoq9+05in1QQ
 pf46+NNgj0IXbJSP/7oA7cN3mZPuUzetULF18V7BX29a/1Gn24w5Q29KkXLvwKPsB1ppMx3cn
 WsuH5bFqhrzgS7XFdcbtPF8uBYA+PwFfbHgzE2Cue61Dp+Pi3KvhT3LqFIgV5LfzsDGDNnH+W
 9o4E7P04Z7eRSIUPqmspY04gCzma6u6vBgsakpHKjPg5fbKfUHJb/fEk++dP6IDYOuyE0VsHf
 2gWJQTpdhsh7QWwtT2gyvQUuEzleW4qHAcYhVgzH1kyyJqWYNbKC3+08NNRDXVB+ncEY4IsFI
 VZgmCszNqxzjTRg29TPJTK+Rkmj32KNLONDyeznDgkMtkQnMRejSsbIhBHkhg3anLCMxNkS3m
 Kixosir1c0mygtbxBmemenNAYzsZ/E0zbMzk6jt/eszR79S2mlx2zHyutPNo32ApZliAVWqQk
 w0ZjEAmHzy4/25jvFnfcHYaSGrg/h7wQ2pZUI5soXDFKiL9ZskEc8mNGZVHnw87Cx/tPsHmu0
 =

Am 16.06.26 um 16:35 schrieb Dave Carey:

> The Lenovo Yoga Book 9 14IAH10 ships with a detachable Bluetooth keyboar=
d
> that magnetically attaches to the bottom (secondary) screen in one of tw=
o
> positions.  The Embedded Controller tracks the attachment state in a 2-b=
it
> field called BKBD and signals changes via WMI event GUID
> 806BD2A2-177B-481D-BFB5-3BA0BB4A2285 (notify ID 0xEB on the WM10 ACPI
> device, _UID "GMZN").
>
> The device contains embedded BMOF data (WQDD, 20705 bytes) documenting
> both WMI interfaces used by this driver:
>
>    LENOVO_BTKBD_EVENT (event GUID): WmiDataId(1) uint32 Status.
>    The ACPI _WED(0xEB) method returns EC.BKBD directly as an integer,
>    so the notify callback receives BKBD without a separate query.
>
>    LENOVO_FEATURE_STATUS_DATA (block GUID, WQAF method): returns an
>    8-byte buffer {uint32 IDs=3D0x00060000, uint32 Status=3DBKBD}.
>    Used for the initial state read on probe and after resume.
>
> BKBD encoding:
>    0 =3D keyboard detached
>    1 =3D keyboard docked on top half of bottom screen
>    2 =3D keyboard docked on bottom half of bottom screen
>    3 =3D reserved (not observed in practice)
>
> This driver registers two WMI drivers sharing a module-level
> BLOCKING_NOTIFIER_HEAD:
>
>    - The event driver (LENOVO_BTKBD_EVENT) uses .notify_new() to receive
>      a pre-parsed wmi_buffer and fires the notifier chain with the BKBD
>      value extracted from the buffer.
>
>    - The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_dev in
>      its per-device private struct.  At probe time it registers a
>      notifier_block on the chain and reads the initial BKBD state via
>      wmidev_query_block().  The WMI buffer is parsed as
>      struct lenovo_feature_status { __le32 id; __le32 status; }, and the
>      ID field is verified before the status is used.
>
>    - SW_TABLET_MODE=3D1 is reported when the keyboard is detached;
>      SW_TABLET_MODE=3D0 when docked in either position (keyboard present=
).
>
>    - The raw BKBD value is exposed via read-only sysfs attribute
>      "keyboard_position".
>
>    - BKBD state is re-read via wmidev_query_block() on resume from
>      suspend or hibernation.
>
> Tested on: Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.
>
> Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> ---
>   .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 ++
>   MAINTAINERS                                   |   7 +
>   drivers/platform/x86/lenovo/Kconfig           |  14 +
>   drivers/platform/x86/lenovo/Makefile          |   1 +
>   drivers/platform/x86/lenovo/yb9-kbdock.c      | 310 ++++++++++++++++++
>   5 files changed, 351 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-k=
bdock
>   create mode 100644 drivers/platform/x86/lenovo/yb9-kbdock.c
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock b/=
Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> new file mode 100644
> index 0000000..04e5293
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> @@ -0,0 +1,19 @@
> +What:		/sys/bus/wmi/drivers/lenovo-yb9-kbdock/<guid>/keyboard_position
> +Date:		April 2026
> +KernelVersion:	6.10

Hi,

please update the kernel version and date.

> +Contact:	Dave Carey <carvsdriver@gmail.com>
> +Description:
> +		Read-only attribute reporting the current keyboard dock position
> +		as reported by the Embedded Controller on the Lenovo Yoga Book 9
> +		14IAH10.
> +
> +		Possible values:
> +
> +		=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +		0   keyboard is not docked to any screen (detached)
> +		1   keyboard docked on the top half of the bottom screen
> +		2   keyboard docked on the bottom half of the bottom screen
> +		=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +		SW_TABLET_MODE input events are also emitted: 0 when the keyboard
> +		is docked (either position), 1 when detached.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e1..00e8275 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14479,6 +14479,13 @@ L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>  =20
> +LENOVO YOGA BOOK 9 KEYBOARD DOCK DRIVER
> +M:	Dave Carey <carvsdriver@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
> +F:	drivers/platform/x86/lenovo/yb9-kbdock.c
> +
>   LETSKETCH HID TABLET DRIVER
>   M:	Hans de Goede <hansg@kernel.org>
>   L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/=
lenovo/Kconfig
> index 9c48487..938b361 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -43,6 +43,20 @@ config LENOVO_WMI_CAMERA
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called lenovo-wmi-camera.
>  =20
> +config LENOVO_YB9_KBDOCK
> +	tristate "Lenovo Yoga Book 9 keyboard dock detection"
> +	depends on ACPI_WMI
> +	depends on DMI
> +	depends on INPUT
> +	help
> +	  Say Y here to enable keyboard dock detection on the Lenovo Yoga Book=
 9
> +	  14IAH10.  The detachable Bluetooth keyboard magnetically attaches to
> +	  either screen; this driver reports SW_TABLET_MODE input events based
> +	  on the attachment state and exposes the raw position in sysfs.
> +
> +	  To compile this driver as a module, choose M here: the module will b=
e
> +	  called lenovo-yb9-kbdock.
> +
>   config LENOVO_YMC
>   	tristate "Lenovo Yoga Tablet Mode Control"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86=
/lenovo/Makefile
> index 7b2128e..2842d7d 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
>  =20
>   lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+=3D yb9-kbdock.o
>   lenovo-target-$(CONFIG_LENOVO_YMC)	+=3D ymc.o
>   lenovo-target-$(CONFIG_YOGABOOK)	+=3D yogabook.o
>   lenovo-target-$(CONFIG_YT2_1380)	+=3D yoga-tab2-pro-1380-fastcharger.o
> diff --git a/drivers/platform/x86/lenovo/yb9-kbdock.c b/drivers/platform=
/x86/lenovo/yb9-kbdock.c
> new file mode 100644
> index 0000000..dbf7ff4
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/yb9-kbdock.c
> @@ -0,0 +1,310 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Yoga Book 9 keyboard-dock detection
> + *
> + * The Yoga Book 9 ships with a detachable Bluetooth keyboard that magn=
etically
> + * attaches to the bottom screen in one of two positions.  The EC track=
s
> + * attachment state in a 2-bit field called BKBD and signals changes vi=
a WMI
> + * event 0xEB on the WM10 ACPI device (_UID "GMZN").
> + *
> + * BKBD values:
> + *   0 =3D keyboard detached
> + *   1 =3D keyboard docked on the top half of the bottom screen
> + *   2 =3D keyboard docked on the bottom half of the bottom screen
> + *   3 =3D reserved / not observed
> + *
> + * Two WMI interfaces are used (documented in embedded BMOF, WQDD, 2070=
5 bytes):
> + *
> + *   LENOVO_BTKBD_EVENT (event GUID, 806BD2A2-...)
> + *     WmiDataId(1) uint32 Status =E2=80=94 _WED(0xEB) returns EC.BKBD =
directly.
> + *     The notify callback receives BKBD as an integer; no separate que=
ry needed.
> + *
> + *   LENOVO_FEATURE_STATUS_DATA (block GUID, E7F300FA-...)
> + *     WmiDataId(1) uint32 IDs   =3D 0x00060000 (feature selector)
> + *     WmiDataId(2) uint32 Status =3D BKBD value
> + *     Used on probe and resume to read initial state.
> + *
> + * The event driver (LENOVO_BTKBD_EVENT) fires a notifier chain on each=
 WMI
> + * event.  The block driver (LENOVO_FEATURE_STATUS_DATA) owns the input=
_dev
> + * and registers a notifier_block to receive those events, eliminating =
the
> + * need for shared global state or a mutex.
> + *
> + * SW_TABLET_MODE=3D1 is reported when the keyboard is detached;
> + * SW_TABLET_MODE=3D0 when docked in either position (keyboard present)=
.
> + * The raw BKBD value is exposed via the sysfs attribute "keyboard_posi=
tion".
> + *
> + * Copyright (C) 2026 Dave Carey <carvsdriver@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/wmi.h>
> +
> +#define YB9_KBDOCK_EVENT_GUID	"806BD2A2-177B-481D-BFB5-3BA0BB4A2285"
> +#define YB9_KBDOCK_QUERY_GUID	"E7F300FA-21CD-4003-ADAC-2696135982E6"
> +
> +/* BKBD encoding */
> +#define BKBD_DETACHED		0
> +
> +/* LENOVO_FEATURE_STATUS_DATA feature selector */
> +#define YB9_FEATURE_STATUS_ID	0x00060000u
> +
> +/*
> + * LENOVO_FEATURE_STATUS_DATA: 8-byte buffer {uint32 IDs, uint32 Status=
}.
> + * IDs is always 0x00060000; Status holds the BKBD value (0=E2=80=933).
> + */
> +struct lenovo_feature_status {
> +	__le32 id;
> +	__le32 status;
> +} __packed;

Please add:

#include <linux/compiler_attributes.h>
#include <linux/types.h>

> +
> +/* ------------------------------------------------------------------
> + * Notifier chain =E2=80=94 event driver fires it, block driver listens
> + * ------------------------------------------------------------------ *=
/
> +
> +static BLOCKING_NOTIFIER_HEAD(yb9_kbdock_chain_head);
> +
> +static void devm_yb9_kbdock_unregister_notifier(void *data)
> +{
> +	struct notifier_block *nb =3D data;
> +
> +	blocking_notifier_chain_unregister(&yb9_kbdock_chain_head, nb);
> +}
> +
> +static int devm_yb9_kbdock_register_notifier(struct device *dev,
> +					      struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret =3D blocking_notifier_chain_register(&yb9_kbdock_chain_head, nb);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_yb9_kbdock_unregister_notifi=
er, nb);
> +}
> +
> +/* ------------------------------------------------------------------
> + * Block WMI driver =E2=80=94 LENOVO_FEATURE_STATUS_DATA
> + * (owns input_dev, sysfs, PM resume)
> + * ------------------------------------------------------------------ *=
/
> +
> +struct yb9_kbdock_data {
> +	struct wmi_device	*wdev;
> +	struct input_dev	*input_dev;
> +	struct notifier_block	 nb;
> +};
> +
> +static int yb9_kbdock_query(struct yb9_kbdock_data *d)
> +{
> +	struct wmi_buffer out =3D {};

"out" does not need to be initialized.

> +	int ret;
> +
> +	ret =3D wmidev_query_block(d->wdev, 0, &out,
> +				 sizeof(struct lenovo_feature_status));
> +	if (ret)
> +		return ret;
> +
> +	struct lenovo_feature_status *fs __free(kfree) =3D out.data;
> +
> +	if (le32_to_cpu(fs->id) !=3D YB9_FEATURE_STATUS_ID)
> +		return -EIO;
> +
> +	return le32_to_cpu(fs->status);

I suggest you return "status" using a pointer argument:

static int yb9_kbdock_query(struct yb9_kbdock_data *d, u32 *bkbd)

The reason for this is that a status of 0xFFFFFFFF will be misinterpreted
as -1 (error EPERM).

> +}
> +
> +static void yb9_kbdock_report(struct yb9_kbdock_data *d, u32 bkbd)
> +{
> +	int tablet =3D (bkbd =3D=3D BKBD_DETACHED) ? 1 : 0;
> +
> +	input_report_switch(d->input_dev, SW_TABLET_MODE, tablet);
> +	input_sync(d->input_dev);
> +	dev_dbg(&d->wdev->dev, "BKBD=3D%u SW_TABLET_MODE=3D%d\n", bkbd, tablet=
);

I think you should protect the input sequence with a spinlock.

> +}
> +
> +static void yb9_kbdock_sync(struct yb9_kbdock_data *d)
> +{
> +	int bkbd =3D yb9_kbdock_query(d);
> +
> +	if (bkbd >=3D 0)
> +		yb9_kbdock_report(d, bkbd);

Please propagate the errno back to the caller.

> +}
> +
> +static int yb9_kbdock_nb_call(struct notifier_block *nb,
> +			       unsigned long bkbd, void *unused)
> +{
> +	struct yb9_kbdock_data *d =3D
> +		container_of(nb, struct yb9_kbdock_data, nb);
> +
> +	yb9_kbdock_report(d, bkbd);
> +	return NOTIFY_DONE;
> +}
> +
> +static ssize_t keyboard_position_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buf)
> +{
> +	struct yb9_kbdock_data *d =3D dev_get_drvdata(dev);
> +	int bkbd =3D yb9_kbdock_query(d);
> +
> +	if (bkbd < 0)
> +		return bkbd;
> +	return sysfs_emit(buf, "%d\n", bkbd);
> +}
> +static DEVICE_ATTR_RO(keyboard_position);

Can you make this const too?

> +
> +static const struct attribute * const yb9_kbdock_attrs[] =3D {
> +	&dev_attr_keyboard_position.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(yb9_kbdock);

Can you make this const too?

> +
> +static int yb9_kbdock_resume(struct device *dev)
> +{
> +	struct yb9_kbdock_data *d =3D dev_get_drvdata(dev);
> +
> +	yb9_kbdock_sync(d);
> +	return 0;

Please propagate the error of yb9_kbdock_sync() here.

> +}
> +static DEFINE_SIMPLE_DEV_PM_OPS(yb9_kbdock_pm_ops, NULL, yb9_kbdock_res=
ume);
> +
> +static int yb9_kbdock_block_probe(struct wmi_device *wdev, const void *=
ctx)
> +{
> +	struct yb9_kbdock_data *d;
> +	struct input_dev *input_dev;
> +	int ret;
> +
> +	d =3D devm_kzalloc(&wdev->dev, sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return -ENOMEM;
> +
> +	d->wdev =3D wdev;
> +
> +	input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name		=3D "Lenovo Yoga Book 9 keyboard dock switch";
> +	input_dev->phys		=3D YB9_KBDOCK_QUERY_GUID "/input0";
> +	input_dev->id.bustype	=3D BUS_HOST;
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	ret =3D input_register_device(input_dev);
> +	if (ret)
> +		return ret;
> +
> +	d->input_dev		=3D input_dev;
> +	d->nb.notifier_call	=3D yb9_kbdock_nb_call;
> +
> +	ret =3D devm_yb9_kbdock_register_notifier(&wdev->dev, &d->nb);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, d);
> +	yb9_kbdock_sync(d);

Please propagate the error of yb9_kbdock_sync() here.

> +	return 0;
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_block_id_table[] =3D {
> +	{ .guid_string =3D YB9_KBDOCK_QUERY_GUID },
> +	{ }
> +};
> +
> +static struct wmi_driver yb9_kbdock_block_driver =3D {
> +	.driver =3D {
> +		.name		=3D "lenovo-yb9-kbdock",
> +		.dev_groups	=3D yb9_kbdock_groups,
> +		.pm		=3D pm_sleep_ptr(&yb9_kbdock_pm_ops),
> +	},
> +	.id_table	=3D yb9_kbdock_block_id_table,
> +	.no_singleton	=3D true,
> +	.probe		=3D yb9_kbdock_block_probe,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Event WMI driver =E2=80=94 LENOVO_BTKBD_EVENT
> + * (fires the notifier chain on each WMI event)
> + * ------------------------------------------------------------------ *=
/
> +
> +static void yb9_kbdock_notify_new(struct wmi_device *wdev,
> +				  const struct wmi_buffer *data)
> +{
> +	/*
> +	 * _WED(0xEB) returns EC.BKBD directly as a 32-bit integer
> +	 * (LENOVO_BTKBD_EVENT WmiDataId(1) uint32 Status).
> +	 */
> +	if (!data || data->length < sizeof(__le32))
> +		return;

Please use the .min_event_size field inside struct wmi_driver for this.

Otherwise the driver looks quite good to me.

Thanks,
Armin Wolf

> +
> +	u32 bkbd =3D le32_to_cpu(*(const __le32 *)data->data);
> +
> +	blocking_notifier_call_chain(&yb9_kbdock_chain_head, bkbd, NULL);
> +}
> +
> +static const struct wmi_device_id yb9_kbdock_event_id_table[] =3D {
> +	{ .guid_string =3D YB9_KBDOCK_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, yb9_kbdock_event_id_table);
> +
> +static struct wmi_driver yb9_kbdock_event_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-yb9-kbdock-event",
> +	},
> +	.id_table	=3D yb9_kbdock_event_id_table,
> +	.no_singleton	=3D true,
> +	.notify_new	=3D yb9_kbdock_notify_new,
> +};
> +
> +/* ------------------------------------------------------------------
> + * Module init / exit
> + * ------------------------------------------------------------------ *=
/
> +
> +static const struct dmi_system_id yb9_kbdock_dmi_table[] __initconst =
=3D {
> +	{
> +		/* Lenovo Yoga Book 9 14IAH10 */
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR,   "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static int __init yb9_kbdock_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(yb9_kbdock_dmi_table))
> +		return -ENODEV;
> +
> +	ret =3D wmi_driver_register(&yb9_kbdock_event_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D wmi_driver_register(&yb9_kbdock_block_driver);
> +	if (ret) {
> +		wmi_driver_unregister(&yb9_kbdock_event_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +module_init(yb9_kbdock_init);
> +
> +static void __exit yb9_kbdock_exit(void)
> +{
> +	wmi_driver_unregister(&yb9_kbdock_block_driver);
> +	wmi_driver_unregister(&yb9_kbdock_event_driver);
> +}
> +module_exit(yb9_kbdock_exit);
> +
> +MODULE_AUTHOR("Dave Carey <carvsdriver@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga Book 9 keyboard dock detection");
> +MODULE_LICENSE("GPL");
