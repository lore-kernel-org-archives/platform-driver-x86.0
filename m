Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536027057D;
	Wed, 18 Feb 2026 00:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771375884; cv=none; b=IPRcasQyERPlNI3Im/7jVz4xbfqJCM887iRRd4mMbKBtWCNy4565CF+oyrzcpAe0wpdT8XXQmHFx2rM+0CRIpPp6rgNz23ASk5xMtQV6KTESwaDuXM89rQg+Je53gFa9Ix8YmQC5iUh/XGhkQB1+VbTKojU7He+jg+R0qvy9/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771375884; c=relaxed/simple;
	bh=kSXNLSlhLMRH/McAU3ZITbbzDXSTa3OAkXVwqIUYkdw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sr3NvLVo/+CtYGok4GGd9c8tJdeKzav41rnpcToWAjBCVLIbB6KhOGbHMCeJK3moKMyxFMyb7GgLdKMKkq87NQhiygzNZRF672EJdWPWrh32cIPLmY1D/+tmQp1Tr/LeoCFDOHfKO3D6UUA+uNEwnAdT1TjVWyOfoaVKRFwBamw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XdGu26ay; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XdGu26ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771375873; x=1771980673; i=w_armin@gmx.de;
	bh=1xkhUoG9ppqwnfNzy+l9eQqfhUKuVVXeQ5LTu3M+73I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XdGu26aykG6DHjLVfqbyqqyr6mZmVE9HVWTDco0c9ONbO7bdO7+K6g3yB09CYmbu
	 +4kzQoltnl3ddzV4gxbospHuGYuKMZ0eU8pWVjreNTHLStqK9GWBOBkDQsV4ktj2B
	 UWaEklCPFlta71AYd8Bz3AtHohBo9lVrsJrg7Nu2v/KBnNpDlzisQnYMrLMr7ecp/
	 vTqHHW0/CDd1/PPf3VhrdN0CRDh7gdsWy8XXXs71amIXzhP+OwPhlJlCJH8ta5Tg1
	 XL0irhkBNO9+Q7rAL3BlhxpAfN4d/MwdfnfG53C5LhGJOohZDZRphNqrXWZEwGdE3
	 C1uo60uFPpTXvHOpIw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MlNtF-1vT64K1sOD-00lJQt; Wed, 18 Feb 2026 01:51:13 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
Date: Wed, 18 Feb 2026 01:50:58 +0100
Message-Id: <20260218005101.73680-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260218005101.73680-1-W_Armin@gmx.de>
References: <20260218005101.73680-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w+Jfz2OdrIWUCR9165ADsjnIErqHYOW+kv78BiqQinRUNrWoEJo
 ZxeY7JMkw3hV4KHApncChA+LqbhpPM9A851SGpBTM0Y+CglUY4aLFUuE0BDF+1BpzPjrejL
 dkw5bysuzCFPZPMOFLg3N+fX4ZcfTutPehXprEaD6al7X5OCToqCoUAz+sV17OMEO5xgw1u
 HRF8dvXpJFVA33Pt/3KMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WXE0l8SQHPA=;JPjETS+LB2fidsyGwlZ5fYreYPe
 zXevFWKhnDTT7ukuWL/6v8Oc9KVRAgp7fVJt3HjNojkQnIhMMokFwwSYCeKFI2nyICN2WXKqZ
 PLh8Hjsp2t1TUfKpQez/r2jnCp5Ekjftg+aApgPsHj7IMcjAEYgAXTVgqtr1MCVzDtXrkkn8L
 leLzu8xmqFGeVckMFryCTQtPA5oMoc5VjGznlmoRnf6h5U3jfnH8eLXgCo+9FhAHqsk2F0Ye+
 blZ4EMxOmuJVNDvfxtAKhQSCGNuqy5X2SociY5epvbW58iDjcDKVsikXc0rw4SD396+l/vxGW
 EVfEIiJLuJQ45nkkY5y4m0GoD6KNzctEumzEGxrvFis21Zm3ygNNWnZbbBKx9r9sGE2PgBD+a
 YfE4h/wtnaqMn+xQKd9XSyLfO7NM926yY0BOPRKJi3l4iRBj2U2IgWMW/Dk9Ifa3bWR5QpqUX
 8OMCutGkvA/hhpEh+hIrYCIUSMcJeM+BKFpp7CieE08Hlq+Vr5WDgvLZGHwaEl0DJE9r2h9qA
 1TsCt0JVpivSlgz4Y8h6n8z7jR7T76YkSw/7ffQx70ZF9Ct7X21Ha/IwLtGTcloX+JpLp9/63
 9xke3ek+3DfOZF2KbeaeWsyF5Ci4qvu2zO18cWz8KPMEsvR92Mf6kuoXLA/AHblMCIF0eeaBP
 3O3BTndsBwes4ukuXnhedCgIkR3oizQBZRa6DWsQqCOUK3e1Cpd1IW9SXKHaPcIIov3UWKvpB
 yW8AhvxFGmmxv569IYxzm8yDIrFKrKOBo2EH643Ffg2Vu5MJRXdWW0Xso8qjUsQ4JGcuv1/cS
 iKsYYGSXCB/+Y8jiJpxS4Xhcluknecvii/DIcenJ8PP58w0KZO0Ne51s2ouA8S2B2ZiKWJ0DG
 aU0Jgr+2bimcB0MJtZtazD2TXnj2MyzXqg2XZqhrXAQv05fEYziP3sWf12ejduOlYc35AISSi
 vIhms3PlvQrsTq/cj6Op5IGk0a2c0H+RFtVn2hzH+uDEws8bSmdxRsAWgsk6WGD5KFNCtefOL
 JuR2fHzM4/YtGxqGGKv3QHjPN2CpIvyud/gC+X28O2pqWQ+HC1Eb1LYSdZxd6i9jjlIz51UqB
 Jdrenv+6cWrp5ywDvWooDp01tiqQs+LtQb+5O/z/8MSQTraj39mPH/p4MbLkp/YdR4LP8APat
 bn0P8pNAF9XbwxaQEpRQQ9ZLwkSOhWGi4QS2C7tr2lvIb6qgNCHcaRoEVAi4P1rbInMOgvBIU
 tSYe++tkBjpUJXSDkf7Q/ryWc+hNQ/H/rXxJvWuYcC2i7WZrD44KVVd1YYLpvhugi8mSOXECB
 3Cf8tgvoznqmcdWYGPMDLpxOALkvPUv2PT1/TL/uWaYur1hj1wn0kPMPYwde+NBarsxQZnqlb
 zaQCy7OHHCOPFKq0w77zYRt9audh/QCBnZIpWTLmZGOHZGQtJE3vRbFgPD+NCAQTGu218dZXd
 znI5oazCFFL1EFYr+mnhZeCVQJuiFPPJSAVkRLsr1Oi7O+M2OwzsRrdgR1G1IIG2chP83CtG+
 yvvEQSfndkYC9gxICUK5HxwxPU7h4+VHvMj/9Yp8o0Hs2xVAT0Z6lRypFRhAU9+uPRdoAfzfg
 WyTDoPO7xNH4YSgg3yliLvpPWWzx+JKRMwBxLPCUgquhwl6t+2lWqEu87ox0mLbwtuXXImlio
 kIemMJjT6oG3UdWRCRg9dRVz5mIZOqB+CMhre6bNpvwvitIvpmmQ8qYVdzwYDEuvUWo1Ft5gM
 oRWPm8MEIBD2yK07dXaDDq2JEoJ+Ap/XQ0yp8xoYdsOqOnxXATuoDQdxT5cViYNbJD31PS+cL
 wSV0wJeHkQryQXf5TErh0vWYwgs0HwTgG/qfzuH94LqmRl6bIKOK5LtMN/ncPV+IgClmD+AI/
 khA0nvm3LCC337HXUS9N2m4XZOfsTFZfbXsJnWicwdtNl0x8WP66k4JtcHfQYminkVPT4xBo3
 N+2vHMloTZ/3Y7hgts7mjhypYn0fzpyNikptALhZHBjRdQv4ci02I4OrbzJDH+WhE45AcCx/j
 Tl5Iys4w+SZwv758jL4LRrTr5dbTD3v8XqR2WiGg+S+QVM9RLK8GHMvjehyGq7qyIBiZ9bpV2
 KQQwtkqQUu0lmMxtHXh3YpH/p1m7lPMLGXC6nkCAa092/+9uzO+orZJC0THy+/VvHmMOIjPbj
 ID9bAD0XduhAiYoOaTyboMjr0j0/Gz61M82g17+TbqNa4V9pYbYgMjvepbvxrluSojcdT0QaK
 I75VT/kvyVJNWsXpQel8LK2XKskRS+S6alKH+yVwEHD5EATwAYOpMMBsgroOnFMJHgpULmw4d
 sdL1U8Yl95+J/qHxHRi6LOxmlotXrGGZLDRcud4Y1HX8Vs7lTkRn1+gbbqjp7mDt5txGA+MJH
 DJkQfeXd7M39O0Ma2pMZON2V7PW30t/y5v1//NKNrRkRcMtvygIKww5eUuWAi6/zo/vw/mcU1
 MAPy/VsSrFmZMZU44/lRQFW7Qplh0gW28r5SmkkquQIxjRYarsmFzZ5sE1wfoj3AdmP1lY3+O
 xq+L4jVWeWlDkKdFrkDeeRPFcDyAjrcjhg9xe7ltoo2KzQvAaUYjx3H1gWjZY8TnvviJSkD+m
 1m/XMFOHWbzUH8f5NkEk2UC5WB8KUxfIzw0/xNSUJro+g0w8WzoAtP9czLNc+mTEi3vvBHW5M
 pWBpm/PVLZrRDSWMqtRQc7IDshfIw6yHrBG2v/PJ37wVCrjL/NLUraG3gwuOrKKg1/7ZWUVxS
 9/sZdddZzJ1EcrMr+9EGSC8UpgVHejg2Bhz0DCN0WLY2R7/0c7We0EOtmQIXQXfn3nZPGH5eu
 OtPSyBVQu2CKX6unBrj5OfcHKvIZnnbAXjygy7CpkA0KTUDnIE8L/HukOmSup4koE1bfv8TmD
 BFAnIbCZ/5YA5f7SF/vpYjYiLl5Y/wG9RDSYA0e9bM66oRK2CCYzbxQ9h0md8dxO3Ip7+YWob
 ZzTEBj0HCqcilbnZqmBMSGkCua7DHFMtDnoTemEwJQA5ipRY77TYLGwBxlnWw75eMwRvvViWd
 QtK/wjypo1QSLrUWVeCR1YS0txtTg/umR4Gg+w4XLYUCcRZVW1W1WB+78+dzQSg6/ZVoVT0F6
 zc80kf4XxU17BAtJ45HXqqnsd7lx92uJuaOLV3BgkLmOfqtlqQbcloZewz9ERu3nsS2pntzEv
 PIMf+rquTAYD2oV0Sr1C9gWLd38iLHPx/29Yp5vAPdVtW15l2YACzP7mP4eT/FGGyt67fRYPq
 Zefzd5d4fMwSaaXZNKV4rEBIRSm1TTiFCDXrxtZrSlFcvcwF2eyXzyjcn6iGRHuqL7+zbhzIT
 6TYKYHl61rtrYYtX3tM8RMardLtFNd33N8tI6SfD9m4B6pq2PnktuIzyq7YXVzsbp4jKR37dR
 A1/GUV6VZX/4XB0ZrQUALtUrd8tnCjDPQNj9FnR2LpcHBNXlwKrAgabnOkhPP0o5lMAPhw8YJ
 xjWg5obslrNhmxP6mRfwdaVh3YHkFf328m+/qTlnCrt4oKJoLZYwXPdrNCR3hlm5CyqQmFZGE
 V8D+tMCuKTCMps0gJER6U32o2wtYYzHS6ytlO7soq/lA6Pp8cyKKIaB6A5dpKNSXrp3p+fneB
 SV2bLuaxt8HjmBnhQz/IP6zBfd/4B+JYqBFbKM/8r+qSi0qOla+cm+6fnI4k0CjWafvHWtc16
 PC0PjHtlXdtjjur9RRYS3wQTlYHreho3P+0qIObO3/fFRHcQSrQDXEv9nVZhdWG4kvrns37mP
 Du/18WCuIR5oMzeGAI7LDEgqGXu4SYUQV+hcbgGseH1i+M+KL+JWqMEK+00SFNEmJGXJaZa8d
 5T/jcKR6D3NuSD5/4p1Ppq7rSdNkX/xE6HZgn2Zqx36PPxi7XvXYM/SfXSPVzY3EDvLtjoe3c
 K472IlcZWH1w8lbdat8y4pgzkNvsdJhvx8dVXm1PbQf9hpqhloCOuuCQVHmO1bYNAOx02SeKq
 icrEWcALTb5mGBk5zYdIKWBPRvz9KAjwG7w1h14K192cj3aC6/f5lDU/w+uAgqaxRxTf+82CK
 Pri0oS5l4Saz+cBlqKrCrt8YjBFcsuBC+Psn8Hg7YJBhLXGS4zcQ0gA5fTkLA5pSQCcQvVk3p
 H4m3G96VNIEXjB0tAeKCwSqSe2hNH6TuqTJQM2BebWf8cljWL41EPTyz4B6xTq09Wtwifhupf
 haa3Y67wHLCIRqkQHxnZR9ScnD61sr9rfsIJkqium9fAgjUuyjkwCh8yyguzyuiRNmbS3pUTk
 w8lIZM2Z5Q0UWDc5mPd44k1QiRwZtR6qfQUpB/9wiHDHUJ1iU7GZeP3FQXFNyVXG6sd+npPLp
 a+4GoGFzuliMbD2LGjBRIqYyYPvHutXnroweUtY+Z0QW0cyrReNEnfd6qF67cDZDZlO/qRn6M
 TRquCXzfo8RmYTLasOnHEhKOPWZqNaJFmR6OHfND1TLLPunzvrfGnVlXPySz9mN39ElPkQFbq
 fsVEJpf0E9USEYbl6cX5vn79Vcu2zdcFyAeoBuC02Na57J1Q+Utqxve0nxn8JJOA1W0/8cSLh
 p88PJuJUVxi/NNVBH1PkPTxJprxUFYv92b3QraSXbLnEio68KNsChrlST1Q0pKaHgV1IAM5GZ
 ddEFviL4dim4lNgRJS1hqo5x4VwENDe+NO7AXFIcHD8Ao270H99idZ0C6qHVtrG6hUYKdEdXa
 VrHlegNgRH0IscnKS5U0yHM9YGmqwXtyzkrdZI3HydQjkdDwBUPj07yQwFckhAZ7o2XyjpqYY
 i6bVj63AHlk/M0Q9c/qVbhEP78S5rN/VSg+AUB3i0wCLYZCrjARD4TkLHcAI2qyQ9T5ZGGSWx
 0eVlzgSLNBF7C8uBVuhiTBN7zk4e9lWhv6W6+uETcwzZfIL52zqfcZwFT3ggKYy1HF7q/JS+c
 dfF0FOeqihUzljFYMSy1Ry1lrhXN0lV6fPVH/Pr5Xr+sNhBBZLYOrp7JrI/Attz38fz+530wp
 usrwDtt/Y7JYkj37xkM3T17cvQsMWQTqixCMUl2+DqysRxKa4TisGKHG3LD/lSm4ag8xTAYQQ
 FYHhMeC8uBQ9WxPMUTnRVIs2kPne5YCnjYwbnW8lzgeXACrEZSsHwxorO0iz/TFxAbD9nVQHI
 LnOoYrpamTo7OOwU/TU5z9NE7wUgsee11EYFBozwbo3ilUQMZsfrNHqifm9PUVx5ZhS2AZUQk
 LmdMk4WmPn8tBhC81gs903LZlbAN8DqRX91ScCttvntLnC6by+l0rIdM3NYD0GNKQmCLjstns
 jmFiqVdbMT9F1KbsNka9UhQtO3T/+5u+vE8iEM8A8A==

It turns out that both sysfs attributes actually directly control
the FN lock status/super key enable status, rather than the
triggering of the associated events. This behavior was first observed
on a Tuxedo notebook and was belived to be a hardware quirk.
However, it seems that i simply misunderstood the manual of the
OEM software for Intel NUC devices. The correct behavior is:

- fn_lock_toggle_enable enables/disables FN lock mode
- super_key_toggle_enable enables/disables the super key

Rename both sysfs attributes to avoid confusing users.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../ABI/testing/sysfs-driver-uniwill-laptop   | 10 ++--
 .../admin-guide/laptops/uniwill-laptop.rst    |  2 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 58 ++++++++++---------
 drivers/platform/x86/uniwill/uniwill-wmi.h    |  6 +-
 4 files changed, 39 insertions(+), 37 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Docum=
entation/ABI/testing/sysfs-driver-uniwill-laptop
index eaeb659793d2..2df70792968f 100644
=2D-- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
@@ -1,4 +1,4 @@
-What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
+What:		/sys/bus/platform/devices/INOU0000:XX/fn_lock
 Date:		November 2025
 KernelVersion:	6.19
 Contact:	Armin Wolf <W_Armin@gmx.de>
@@ -8,15 +8,15 @@ Description:
=20
 		Reading this file returns the current enable status of the FN lock func=
tionality.
=20
-What:		/sys/bus/platform/devices/INOU0000:XX/super_key_toggle_enable
+What:		/sys/bus/platform/devices/INOU0000:XX/super_key_enable
 Date:		November 2025
 KernelVersion:	6.19
 Contact:	Armin Wolf <W_Armin@gmx.de>
 Description:
-                Allows userspace applications to enable/disable the super=
 key functionality
-                of the integrated keyboard by writing "1"/"0" into this f=
ile.
+		Allows userspace applications to enable/disable the super key of the in=
tegrated
+		keyboard by writing "1"/"0" into this file.
=20
-		Reading this file returns the current enable status of the super key fu=
nctionality.
+		Reading this file returns the current enable status of the super key.
=20
 What:		/sys/bus/platform/devices/INOU0000:XX/touchpad_toggle_enable
 Date:		November 2025
diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docume=
ntation/admin-guide/laptops/uniwill-laptop.rst
index a16baf15516b..aff5f57a6bd4 100644
=2D-- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
+++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
@@ -24,7 +24,7 @@ Keyboard settings
=20
 The ``uniwill-laptop`` driver allows the user to enable/disable:
=20
- - the FN and super key lock functionality of the integrated keyboard
+ - the FN lock and super key of the integrated keyboard
  - the touchpad toggle functionality of the integrated touchpad
=20
 See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 3c9af441d133..2abae9faceb7 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -314,8 +314,8 @@
 #define LED_CHANNELS		3
 #define LED_MAX_BRIGHTNESS	200
=20
-#define UNIWILL_FEATURE_FN_LOCK_TOGGLE		BIT(0)
-#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE	BIT(1)
+#define UNIWILL_FEATURE_FN_LOCK			BIT(0)
+#define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
 #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
 #define UNIWILL_FEATURE_BATTERY			BIT(4)
@@ -377,11 +377,15 @@ static const struct key_entry uniwill_keymap[] =3D {
 	{ KE_IGNORE,    UNIWILL_OSD_CAPSLOCK,                   { KEY_CAPSLOCK }=
},
 	{ KE_IGNORE,    UNIWILL_OSD_NUMLOCK,                    { KEY_NUMLOCK }}=
,
=20
-	/* Reported when the user locks/unlocks the super key */
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE,      { KEY_UNKNOWN }}=
,
-	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE,     { KEY_UNKNOWN }}=
,
+	/*
+	 * Reported when the user enables/disables the super key.
+	 * Those events might even be reported when the change was done
+	 * using the sysfs attribute!
+	 */
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_DISABLE,		{ KEY_UNKNOWN }},
+	{ KE_IGNORE,    UNIWILL_OSD_SUPER_KEY_ENABLE,		{ KEY_UNKNOWN }},
 	/* Optional, might not be reported by all devices */
-	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED,	{ KEY_UNKNOWN }},
+	{ KE_IGNORE,	UNIWILL_OSD_SUPER_KEY_STATE_CHANGED,	{ KEY_UNKNOWN }},
=20
 	/* Reported in manual mode when toggling the airplane mode status */
 	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
@@ -600,8 +604,8 @@ static const struct regmap_config uniwill_ec_config =
=3D {
 	.use_single_write =3D true,
 };
=20
-static ssize_t fn_lock_toggle_enable_store(struct device *dev, struct dev=
ice_attribute *attr,
-					   const char *buf, size_t count)
+static ssize_t fn_lock_store(struct device *dev, struct device_attribute =
*attr, const char *buf,
+			     size_t count)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -624,8 +628,7 @@ static ssize_t fn_lock_toggle_enable_store(struct devi=
ce *dev, struct device_att
 	return count;
 }
=20
-static ssize_t fn_lock_toggle_enable_show(struct device *dev, struct devi=
ce_attribute *attr,
-					  char *buf)
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *=
attr, char *buf)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -638,10 +641,10 @@ static ssize_t fn_lock_toggle_enable_show(struct dev=
ice *dev, struct device_attr
 	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
 }
=20
-static DEVICE_ATTR_RW(fn_lock_toggle_enable);
+static DEVICE_ATTR_RW(fn_lock);
=20
-static ssize_t super_key_toggle_enable_store(struct device *dev, struct d=
evice_attribute *attr,
-					     const char *buf, size_t count)
+static ssize_t super_key_enable_store(struct device *dev, struct device_a=
ttribute *attr,
+				      const char *buf, size_t count)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -673,8 +676,7 @@ static ssize_t super_key_toggle_enable_store(struct de=
vice *dev, struct device_a
 	return count;
 }
=20
-static ssize_t super_key_toggle_enable_show(struct device *dev, struct de=
vice_attribute *attr,
-					    char *buf)
+static ssize_t super_key_enable_show(struct device *dev, struct device_at=
tribute *attr, char *buf)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
@@ -687,7 +689,7 @@ static ssize_t super_key_toggle_enable_show(struct dev=
ice *dev, struct device_at
 	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
 }
=20
-static DEVICE_ATTR_RW(super_key_toggle_enable);
+static DEVICE_ATTR_RW(super_key_enable);
=20
 static ssize_t touchpad_toggle_enable_store(struct device *dev, struct de=
vice_attribute *attr,
 					    const char *buf, size_t count)
@@ -881,8 +883,8 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_dat=
a *data)
=20
 static struct attribute *uniwill_attrs[] =3D {
 	/* Keyboard-related */
-	&dev_attr_fn_lock_toggle_enable.attr,
-	&dev_attr_super_key_toggle_enable.attr,
+	&dev_attr_fn_lock.attr,
+	&dev_attr_super_key_enable.attr,
 	&dev_attr_touchpad_toggle_enable.attr,
 	/* Lightbar-related */
 	&dev_attr_rainbow_animation.attr,
@@ -897,13 +899,13 @@ static umode_t uniwill_attr_is_visible(struct kobjec=
t *kobj, struct attribute *a
 	struct device *dev =3D kobj_to_dev(kobj);
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
=20
-	if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
-		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK_TOGGLE))
+	if (attr =3D=3D &dev_attr_fn_lock.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
 			return attr->mode;
 	}
=20
-	if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
-		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (attr =3D=3D &dev_attr_super_key_enable.attr) {
+		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 			return attr->mode;
 	}
=20
@@ -1505,7 +1507,7 @@ static void uniwill_shutdown(struct platform_device =
*pdev)
=20
 static int uniwill_suspend_keyboard(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
 	/*
@@ -1565,7 +1567,7 @@ static int uniwill_resume_keyboard(struct uniwill_da=
ta *data)
 	unsigned int value;
 	int ret;
=20
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
+	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
 	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
@@ -1643,16 +1645,16 @@ static struct platform_driver uniwill_driver =3D {
 };
=20
 static struct uniwill_device_descriptor lapac71h_descriptor __initdata =
=3D {
-	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
-		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
+	.features =3D UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_BATTERY |
 		    UNIWILL_FEATURE_HWMON,
 };
=20
 static struct uniwill_device_descriptor lapkc71f_descriptor __initdata =
=3D {
-	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
-		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
+	.features =3D UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
 		    UNIWILL_FEATURE_LIGHTBAR |
 		    UNIWILL_FEATURE_BATTERY |
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform=
/x86/uniwill/uniwill-wmi.h
index 48783b2e9ffb..fb1910c0f741 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-wmi.h
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
@@ -64,8 +64,8 @@
 #define UNIWILL_OSD_KB_LED_LEVEL3		0x3E
 #define UNIWILL_OSD_KB_LED_LEVEL4		0x3F
=20
-#define UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE	0x40
-#define UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE	0x41
+#define UNIWILL_OSD_SUPER_KEY_DISABLE		0x40
+#define UNIWILL_OSD_SUPER_KEY_ENABLE		0x41
=20
 #define UNIWILL_OSD_MENU_JP			0x42
=20
@@ -74,7 +74,7 @@
=20
 #define UNIWILL_OSD_RFKILL			0xA4
=20
-#define UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED	0xA5
+#define UNIWILL_OSD_SUPER_KEY_STATE_CHANGED	0xA5
=20
 #define UNIWILL_OSD_LIGHTBAR_STATE_CHANGED	0xA6
=20
=2D-=20
2.39.5

