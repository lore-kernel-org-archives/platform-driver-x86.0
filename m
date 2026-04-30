Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF682580D7;
	Thu, 30 Apr 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777556488; cv=none; b=efPhrpTJhNnnsWG1bZjYa4Sk3RVa1v9VRIkRR8CxfEtrrh5p7YXjL6hFkOCDmZKcEuyLwXowbSWAIJktghnw7dfQIQDgjNKGyO9jg6KNOuiMCY5Vk29h+X085pzMkdS3/2mCa2bPd2T5Z1+OdQyVyuo1x1hjEu+BCMaTHOUNYvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777556488; c=relaxed/simple;
	bh=mlZhw9wjxZRLZTTq6gW1T0rBJikDOs7GVLUAyQfwMA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqVZ3hN46NE/U3N2phnXww4g9BjV7btcf3w8nkIWLLv588UCEFopQGLV6Z7iS4KPfnoAzNThg2mKjogvjLN0GA4RfXBrF9pDDWy1F53ltr2ZskjGpez/cElXksUYxuThIZa4Rhvhf9eS3q83QZbW9oi7wr3oR2K+wqc9gTok0Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bVWnAnr/; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bVWnAnr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777556483; x=1778161283; i=w_armin@gmx.de;
	bh=4aXUzA8seTurINZvdJpCI94JeZsJiQv+cpvkzo+qpkg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bVWnAnr/zm9i6K3p16DtglEX9WgtuggQHwQGxZjmyc4n7S8lzv1AYMWdxj7K6BX8
	 q3J5PH8vWspeh36jNNnToJLdsUetdyTntZpqEysormeWS1dfMAXo5KQ38esZEXBdr
	 1PVDuWhivjunOaxevgM9hYGNHeS3tWNO2HDPOpvl2u+LPEJC2p0QlY3h7BGiFZqd4
	 HyznvfxaYL+euwTsboNwK5fkGEwrBwxjYds9OD5dxDKAvIIOxshy4YLr6G+tpzrWq
	 4+jEYOTAbLv8W12Uo4Vyq0mBE/weJzzrcJZli2FuRpAL9BXfUwZ2KIazxSZSvVX22
	 H7qLRWX9mfZmlIBymQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2W5-1vatUr0AAJ-00ZgLc; Thu, 30
 Apr 2026 15:41:22 +0200
Message-ID: <6570157d-d431-4275-9e73-d09bb1b344c8@gmx.de>
Date: Thu, 30 Apr 2026 15:41:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] platform/x86: uniwill-laptop: Add support for
 battery charge modes
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260417050912.5582-1-W_Armin@gmx.de>
 <20260417050912.5582-8-W_Armin@gmx.de>
 <e71bdb43-7fcf-519c-c25f-f59cf1489043@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e71bdb43-7fcf-519c-c25f-f59cf1489043@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pt0joJW8GIiXkyy/6HsMhVABkoN2la7qrgTQYUrZL0aVkGCu8AH
 O+AouvL/O6vJ2C56LUqJJKw1lSl6+K5RM9LHR6kDy6/hc+wipntx3FeTQ4rUi3LXnZ9VZBX
 /dCfq49qR1Gm+NEZlFTBJRaKjAOY76Y18wwH+e/iiywxGMT/sF3qXSdwMQuf19fR1cJIElc
 uxVZoKuCWI57Ln+BKG5Jg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KxVs+w/zP2U=;5nCVd0EORXYegQK7djWqbpkPYgS
 2YPZHVddFDS07wDPziEUCNh4I8fs4rY45nqym46KhbnuPfjxiyhkxlTgDYgKA4RfcEQzt/S1T
 5qQGMaCXp+KWfo979cVRdn70UU99d1DHMXGXccIc1+IZsSEdVyNuTejMSfB+Ck49JCzok7DE0
 8AMaf3u0+mBmAOUYfPtXWMntOWV3Xejt5sAWkss8jw6jtHcfCFRZZoRz33zOzfLPk+BIi8i0G
 mYUlzS4+ARO6n02ro++q1dJSrRSwryouFthwv/NFr7+HPafTsUAWR6x3iRFGEvJrrRy+JtLl1
 Wyo5/0akGggid7z3yk/bcT4J3TSZyHmq2PvzdmPZBYQyUFFS7d0eKOEqOaUVFrltw2W/e6EoS
 7pYKoUAqGq9bvvYAX3HA+f4SKQTFnyPn+p/KwCIWlbgRjpxo2dle2khW/zBzmyZzMLZ7wdgSp
 PDtbPfTRPg6eIei60a0EJG46/DUQ6G8sp0NakVbfwV3uGb4PCDpkQP+wBJrjOoKcYR0WbQ5cK
 Ay3P6CmiXfxZv8GEItpChw0mNkSE0VhalJfxOSryeyNM75DEsD9ZIuQCCoQgydVf9w5fXw3Ad
 wC07NokgHiItjCRlUNMCK4fz2jshgjydlHDqC8X8D6LV2LZUUPE6GgH6BAuwRzaY6ZdrCd6b0
 Bx6RPCd12O9flMyDwIpcKEcYBTd/29+x5xuw0b2hzM9adsIceJ3RueEkp63S0BpeCWp9UJ9VJ
 4kMVLDFJPRXtdCYQFbs8D3LXvPykMbHi4gUs7aeIp02Ji7G0wmsLc5DyvcLIs1WwNrXQKsKqB
 VOkSQv0d2BznAR/HyNnQMA2M5Q+fO7sYQ3wm5FqmvSc4avjFQmkSQvVccBC4IdOYvnJDBNVZ6
 6X4alPmMQoohlOlEEnSYfSAHmpjPd7DOU1z4J2M4ieMse8T1Q4eMwZeUh6vdJtK9//1Ro1x7d
 Hji3Dwkil6AwswfFcxtun+6+i/Jcdf/SLVyTGnlp8944LpDySkedYvTVP+bVQTZU4dAmj3I7Y
 bfdMWk77cgCw4ysFCsRepk4gQcBZi/l+pQVo5WaV0Qpx8DwwuvwRVTd3Vkw65pDymUonlHmqO
 H99VTEMoJ+DwZy9wNikU7Nvgm5RfTe/eOEnxrkyaTr8GbUp8R80IagrOWOzZzPjvUJr7O2m4R
 wDGjGzYhn8RrzuyyaVKN5/kgGPW8rdHLynvWdMzO7Dww46ALwfQ+PmoFZmJtnIKCEfCBu6bvX
 izK3H1k7xNl2y2hmdUSetyp8UJKpL2IFskpxQhn/cPgd8yuOvobgSufLvFW4zqW9gVam4aVoy
 ZmkgE3lMWcEy2wxQyZlarNP8mi7EROdmNI2E3BJY0dpcOrb3dBPZnwrG9qepcnLcEHVFkWlN9
 nsGaI7Yme9QOWvUjolP+rLA4e4lEU/O1WG/BS4SQTl5KbTOz1PU432vVtlR3dUwNd3/nBN/JK
 9WLXOyig/KKd/fvFOHVYIPeFFNPt8KWZlvHq3i1qYsFOH2IOnzawEeY1PGCblQQzedqPY4Zg8
 raPDTFu9vXFV8/I/hjVuVQ9Zw4qJ0HArR75kyEzBZ4NWI1nfO/dHwvpNaPIaNTspvIDtmFPHm
 xcsAJKa9vAxgK3svDN1kS1L1f1pWI5p8gzP4CFaA0tFGM3guGgBDuP79EzC00+rVtjIrTJsC1
 qvGPAa/77fZZ/jBXTOdfLWhRlRngv8/3b2eeBePXtt5hWRHj0uC9IVy01VMmSluO1GXvVCCjh
 Kej2kqhT3JkwVmYfk0LWMnX5VuIFmydUgxn815A7i6GWkIpj5Qv1d/sgNmOWGg3yHi/Xgh70+
 K2Xe+FEu+8zvM+yx6AFqV2xaQgeSfqry7skm29/Mc5jYP7hgs+Ndn5heDGh4/wOCcDgSgTvu/
 H/bzi9vezCBftHc55SMsNVi9r+bh1Qu097rie5A9MGH1CGcEOlgeC5WUrSP2SxulqUv5EY4xk
 YXD64OY/FwTMVN2rYgjK4eF9nFueMEfjRY2H5A2ZA9e0xUsRFd93T/sbfm7mUefQopfzKRTuR
 J6at2Nlnkr6LusHE4y9ksMlIl/IzsPdr0pWluEIJSKwm3MAt2m1HZeZgTwNgFH7tGHj2nuz1f
 F7oJGXa8WQO/UkzBOMCxD+x4zHuQI/siUajMb5iFVdHnIatNKPi6NGcTuvuoNjgVRzOvqAEuj
 q6el0NQ1a2hLJPBMbckJW/tubbQIWmckRKlwPBUS1EbwCFIeR/FF6uIiatOkiQyHylBpDiw71
 HdItdT5QFsyiCXADyj0ZaK93rO6ypc5nRD3LNcaZsuM88shHgSuy1pR+qrwMRmiXQhP9eH+2R
 qLhPs6A9RyecDsI/Cgx/cP3rhBsZVjpzbprYpse54vIR/7ZoFgBwqlfCsO/f11x/qJRjfB1Qk
 9T9Ieyj9UUXsp5pMa7neYPWO8HTFUUa024N0tw66aSRbHFPh6QgdlroiRomi73MpXxaAzmc35
 EWk1oa6l1kiBbpNmBLXgjVx4ROOjCQYixq7Mu8PX5zzBI+dhx4IU6yykdyqLZDxFT2zuE8x/j
 lk/X04C9wXOvM0X0gyASRwT9cnTss5UaET3NewUPqRGM++1+RmqDGY6vYE5bK5l7VfC4Ud9gJ
 zI48Wf5jXdxXnr+3V+v4/vadL5M/E903IaKr08VQiEjFAsN+gvFK7QDg+d1Ad6q8boKVa4w0p
 G/Afc8y96q0kdGfPGuE/5NtI8VV74LGGrWgKLLzvyqneXQdCwDy8CFDNJygNSL0nEX9PU31mh
 zf5cLXIo2shpTjxfz/ZZyDzePlFruRWLmsrfWPLsWq43oUfJ3/OSWWdJ4aYbKSHxktPhYx4Tt
 ySXjsdZ7/mQgXChG3miybVYOqFquUQnvFxYhv+OU60bAIBPpHsudBoNBX7tXAVTwMRU8/qXZ+
 PJZlJXVnatyRjFB7wh6Sfxm58ThZLsSr32tTeAiwxPfBeqmUL1R61YJC+BJ58UNEd1VIPDDaO
 bGdLVhoaNDnx6wigMFgU9YE6lR2AOSzQ2jbXp9ThoJBDfbdvP3y6hwnU8NwGjxn0jZHgmfPgz
 veW7UAcvaG0WBkiJrSwT42PFfqTUWf/nqATdWmx9bMiGy33ErkgNaBr7ITrA1KfrxjqZC3uuI
 94euql71Jqm3+GZLqtu0bW2aAeY5wNeKoYklSQ0jwqff0Vj9XVoz8rxLPxbbW+57qAzp02pst
 dggW8BtkmKyMzGMABPDPo5od1IXNsVAXwRht+mYjnie6Acr+19hAMEmCfvU1FCD5UlUF1+jjC
 U6DfDArLu5ECK+dggHN6A46QvsPvrHx0ta/NCkwTEbsi42jr61tO16mghylQChEcOIddBHn56
 ftK3rUoizdCmH7KCJMKNS1QAtZJ4YISK+J/1G/x91vlG2/wKIOc+47G5MgvAjZz29CxhSroPQ
 0QXi7qHeYLNDd3L2IxdRiOj3pu6QnseR0EAzg0d7CxDftLyvQsBrCQBY8qiXvGr2nK2TD/EhS
 UQrIaT/9Tv4Uyfgk9UaX+mYy9nEsh7LP98CPIrfOA/6ieO5BXgT3m/ompOXtxtZUPQzEkeWYb
 bw+2te00ooTZZAyhttHU1xhjTLN3T6dHfi3HDjXqG60OnMfPzld+lSw6eKzUV70pQBbQOoKqh
 k5yNJCMcQWDLObG/GAUfFpGfP+jHlw324UePVcOopiNRFXzCjOUTz7/Co4bH6brCxMby0nH3D
 lwr8n+oWcDqtqVwtdTY6eQPJt9z2j3OQlc6qhO0zAmoZKdE8A48C795MyGKFHs+0HK10EHVgZ
 JeH+nroLOJ+1gIbNWlK3L1f3WnHBFBi6Ny6vKnDCSL3y3RB6Fne/OuPbhca1M9/YKVyw2VUCB
 wl0qgX82iyrkwF/CZZl5YFgAJfi5/kWUx5ngx7a8caVa3W8SQTDhQpE7z0Q12rjoqziNY4hSw
 OQ93JXQnLWJEg7ttbcpOfEf66icMLfKXOQXK4b5upL50/fulatY+yJArF7UqgB8oZ6cQ4LHw3
 6UithFzRVdH0eJpXaD3fAXXPhWVO4t71FULxXFGPjzbrIfQvO4yNc15pm5NsfJfvZeGi4ocLl
 QWoZX2ceRd5C7ABJPvYr76jFDY+ZfFlcgNSOnf4eMzyY2IAYv36bijqwQ551WzcubICxcihjV
 gw6u5NEjjPP7Y7ywfGnl9+0dD2eJwFDV1k9XaOpEgeuM565oeoDKQa80QyWMX3H8QyTb9ZomP
 2iJoGIkx8K8zYtIjPoxBQ21COoEyZdd5+3xVS1EsCbK5G5C/1JopB5FeI65jC2BtyXWfZZ2L0
 cOaFAAjt9VeH7y832qbx7f/xeqzt/jdCOnrHkGqwsxjBec4PQFNQ0hmUUn5VUjAKk1G970XWp
 Kd+yrrHp7HkCvr1dD/L0EZDjVUpgcPdcTCoU0j8+BiT1F5FcstiZtfW1dA1+edBkRk39rrElY
 lhKyI1oExz2VG/z8u98FJB+mgJDa4ReE0kz/eyAufUMJdFMipGTIclN/hs3yu3ZBHiapgELd5
 QPrGew4MG0TwltvclqQ+KGP6+YHDn7DlfLiyLjsDxVoX+e4A5hwGlgXk4NBkiWg8Kx4zzuOfy
 mAz2CdKydmwQQw4hRskluApOituPvMEIAuMIuslOrR4Pt25P4ztaidOB75WRREacjsy8kSToK
 qYgSjR7r7b5r9p99Fr+Z6C77hvyWTcc/q1Gwu/igoydHDCmIKdcFYi368/ld/Ias/ouUOEc3m
 z7wPIpIkQbRbeDz2w3tEWd/Nj8Ys68bnkWRkNlsdw/NJwp8qsWXqfBSgTg8cWIjDPFJad7cuO
 j8+F24Sj1UuD97/btnNm9JZrNAUXEs3H2C/u0hZVi75Zx2su42ZfD60CiL97YmAWnuUISgZPc
 whusHvmhmxJqtAv/ReKGDXXxV86OBF3WVylbDidSCW5mvsO+l7FoODHlsu9SF5LD1GNR7jHxt
 lvhFX5V5soi+d3x0Ufb8E+hebVjL6j5xcU3HeyX9VUDVmt4BUMXtOtllaSC1sHV9Bys3ymAdS
 n01vQ/hiezl6JF5HCnpYj0c+0yTEsVVNWkRhrQJF3IC+55LQD646DtSKFwvgtpMvz78Y7aPCK
 p+XzwppD+rCKo3fPpEAk6IgHjWi2Is1IbiHNi4qVEmb32vRd8UYGdJvVO7unxfPggJuVg8nuN
 kRtIcdDpeEmz3POUqN772U8c67KRnx1qDucJZmEIOv4UoyPV/l0QKbHOjWe9RrwQXTQMjf7sj
 SWJWfuncowGEVjz8/fxRUAOPoCea9A74z4Ur0h3pzxXUjGZTx9k1OKyCYYN7oPFhsTAnbm1W8
 twlERmDHZmzdsXLk39SUFaqNJlamgqNsXiOaV0lSFO/Z3YBzwnw7MycTPHIDPDgQ/xrWO5p4V
 fnd2Naf6falN5yxsXkMBUHVV+nISE9TMlfmxzWr5hSz4D23gnk9sgcYHUb/JTbc+YzRVHRFlT
 pPvN0ZPK17huZJtoQdcsARq9rHeQI1zmh8LMnzBcJQ2PNEKPgv4iZTYcouzY6J0yY2Iyr3zcY
 KEc5F/lB2yszQujEaWTNuAhAOdgws0yVEkr8ZX/liMVVDma4/6D1oEDxQ3XImm/yB8lqt5FyM
 VCZfCwkoEI7HbHzk76apmbMtuhla4kyn4ZMatGheyADyEg4VErb2UvjW5C0Op6fUHrUSTC0sX
 TVakxM+p6qHvtYD0iI=

Am 30.04.26 um 15:22 schrieb Ilpo J=C3=A4rvinen:
> On Fri, 17 Apr 2026, Armin Wolf wrote:
>=20
>> Many Uniwill-based devices do not supports the already existing
>> charge limit functionality, but instead support an alternative
>> interface for controlling the battery charge algorithm.
>>
>> Add support for this interface and update the documentation.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../admin-guide/laptops/uniwill-laptop.rst    |  19 +-
>>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 243 ++++++++++++++---=
-
>>   drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
>>   3 files changed, 215 insertions(+), 52 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Doc=
umentation/admin-guide/laptops/uniwill-laptop.rst
>> index 1f3ca84c7d88..24b41dbab886 100644
>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> @@ -46,11 +46,20 @@ Battery Charging Control
>>   .. warning:: Some devices do not properly implement the charging thre=
shold interface. Forcing
>>                the driver to enable access to said interface on such de=
vices might damage the
>>                battery [1]_. Because of this the driver will not enable=
 said feature even when
>> -             using the ``force`` module parameter.
>> -
>> -The ``uniwill-laptop`` driver supports controlling the battery charge =
limit. This happens over
>> -the standard ``charge_control_end_threshold`` power supply sysfs attri=
bute. All values
>> -between 1 and 100 percent are supported.
>> +             using the ``force`` module parameter. The charging profil=
e interface will be
>> +             available instead.
>> +
>> +The ``uniwill-laptop`` driver supports controlling the battery charge =
limit. This either happens
>> +over the standard ``charge_control_end_threshold`` or ``charge_types``=
 power supply sysfs attribute,
>> +depending on the device. When using the ``charge_control_end_threshold=
`` sysfs attribute, all values
>> +between 1 and 100 percent are supported. When using the ``charge_types=
`` sysfs attribute, the driver
>> +supports switching between the ``Standard``, ``Trickle`` and ``Long Li=
fe`` profiles.
>> +
>> +Keep in mind that when using the ``charge_types`` sysfs attribute, the=
 EC firmware will hide the
>> +true charging status of the battery from the operating system, potenti=
ally misleading users into
>> +thinking that the charging profile does not work. Checking the ``curre=
nt_now`` sysfs attribute
>> +tells you the true charging status of the battery even when using the =
``charge_types`` sysfs
>> +attribute (0 means that the battery is currently not charging).
>>  =20
>>   Additionally the driver signals the presence of battery charging issu=
es through the standard
>>   ``health`` power supply sysfs attribute.
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/plat=
form/x86/uniwill/uniwill-acpi.c
>> index d4abcaf87e39..e11b6c8aeb0d 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -254,6 +254,10 @@
>>  =20
>>   #define EC_ADDR_OEM_4			0x07A6
>>   #define OVERBOOST_DYN_TEMP_OFF		BIT(1)
>> +#define CHARGING_PROFILE_MASK		GENMASK(5, 4)
>> +#define CHARGING_PROFILE_HIGH_CAPACITY	0x00
>> +#define CHARGING_PROFILE_BALANCED	0x01
>> +#define CHARGING_PROFILE_STATIONARY	0x02
>>   #define TOUCHPAD_TOGGLE_OFF		BIT(6)
>>  =20
>>   #define EC_ADDR_CHARGE_CTRL		0x07B9
>> @@ -320,13 +324,15 @@
>>   #define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
>>   #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
>>   #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>> -#define UNIWILL_FEATURE_BATTERY			BIT(4)
>> -#define UNIWILL_FEATURE_CPU_TEMP		BIT(5)
>> -#define UNIWILL_FEATURE_GPU_TEMP		BIT(6)
>> -#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
>> -#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
>> -#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
>> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT	BIT(4)
>> +/* Mutually exclusive with the charge limit feature */
>> +#define UNIWILL_FEATURE_BATTERY_CHARGE_MODES	BIT(5)
>=20
> This feature seems to be only available through force parameter?
>=20

Yes, this is expected to change as soon as Tuxedo can verify if their=20
devices support this feature. I tested it on my Tuxedo device, but i do
not want to split the feature descriptors too much.

Thanks,
Armin Wolf

> --
>   i.
>=20
>> +#define UNIWILL_FEATURE_CPU_TEMP		BIT(6)
>> +#define UNIWILL_FEATURE_GPU_TEMP		BIT(7)
>> +#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(8)
>> +#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
>> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
>>  =20
>>   enum usb_c_power_priority_options {
>>   	USB_C_POWER_PRIORITY_CHARGING =3D 0,
>> @@ -339,8 +345,15 @@ struct uniwill_data {
>>   	struct regmap *regmap;
>>   	unsigned int features;
>>   	struct acpi_battery_hook hook;
>> -	unsigned int last_charge_ctrl;
>>   	struct mutex battery_lock;	/* Protects the list of currently registe=
red batteries */
>> +	union {
>> +		struct {
>> +			/* Protects writes to last_charge_type */
>> +			struct mutex charge_type_lock;
>> +			enum power_supply_charge_type last_charge_type;
>> +		};
>> +		unsigned int last_charge_ctrl;
>> +	};
>>   	bool last_fn_lock_state;
>>   	bool last_super_key_enable_state;
>>   	bool last_touchpad_toggle_enable_state;
>> @@ -447,6 +460,12 @@ static inline bool uniwill_device_supports(const s=
truct uniwill_data *data,
>>   	return (data->features & features) =3D=3D features;
>>   }
>>  =20
>> +static inline bool uniwill_device_supports_any(const struct uniwill_da=
ta *data,
>> +					       unsigned int features)
>> +{
>> +	return data->features & features;
>> +}
>> +
>>   static int uniwill_ec_reg_write(void *context, unsigned int reg, unsi=
gned int val)
>>   {
>>   	union acpi_object params[2] =3D {
>> @@ -1421,6 +1440,30 @@ static int uniwill_led_init(struct uniwill_data =
*data)
>>   							 &init_data);
>>   }
>>  =20
>> +static int uniwill_read_charge_type(struct uniwill_data *data, enum po=
wer_supply_charge_type *type)
>> +{
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, EC_ADDR_OEM_4, &value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (FIELD_GET(CHARGING_PROFILE_MASK, value)) {
>> +	case CHARGING_PROFILE_HIGH_CAPACITY:
>> +		*type =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>> +		return 0;
>> +	case CHARGING_PROFILE_BALANCED:
>> +		*type =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
>> +		return 0;
>> +	case CHARGING_PROFILE_STATIONARY:
>> +		*type =3D POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
>> +		return 0;
>> +	default:
>> +		return -EPROTO;
>> +	}
>> +}
>> +
>>   static int uniwill_get_property(struct power_supply *psy, const struc=
t power_supply_ext *ext,
>>   				void *drvdata, enum power_supply_property psp,
>>   				union power_supply_propval *val)
>> @@ -1431,6 +1474,16 @@ static int uniwill_get_property(struct power_sup=
ply *psy, const struct power_sup
>>   	int ret;
>>  =20
>>   	switch (psp) {
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +		/*
>> +		 * We need to use the cached value here because the charging mode
>> +		 * reported by the EC might temporarily change when a external power
>> +		 * source has been connected.
>> +		 */
>> +		mutex_lock(&data->charge_type_lock);
>> +		val->intval =3D data->last_charge_type;
>> +		mutex_unlock(&data->charge_type_lock);
>> +		return 0;
>>   	case POWER_SUPPLY_PROP_HEALTH:
>>   		ret =3D power_supply_get_property_direct(psy, POWER_SUPPLY_PROP_PRE=
SENT, &prop);
>>   		if (ret < 0)
>> @@ -1479,13 +1532,52 @@ static int uniwill_get_property(struct power_su=
pply *psy, const struct power_sup
>>   	}
>>   }
>>  =20
>> +static int uniwill_write_charge_type(struct uniwill_data *data, enum p=
ower_supply_charge_type type)
>> +{
>> +	unsigned int value;
>> +
>> +	switch (type) {
>> +	case POWER_SUPPLY_CHARGE_TYPE_TRICKLE:
>> +		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_STATION=
ARY);
>> +		break;
>> +	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
>> +		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_HIGH_CA=
PACITY);
>> +		break;
>> +	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
>> +		value =3D FIELD_PREP(CHARGING_PROFILE_MASK, CHARGING_PROFILE_BALANCE=
D);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return regmap_update_bits(data->regmap, EC_ADDR_OEM_4, CHARGING_PROFI=
LE_MASK, value);
>> +}
>> +
>> +static int uniwill_restore_charge_type(struct uniwill_data *data)
>> +{
>> +	guard(mutex)(&data->charge_type_lock);
>> +
>> +	return uniwill_write_charge_type(data, data->last_charge_type);
>> +}
>> +
>>   static int uniwill_set_property(struct power_supply *psy, const struc=
t power_supply_ext *ext,
>>   				void *drvdata, enum power_supply_property psp,
>>   				const union power_supply_propval *val)
>>   {
>>   	struct uniwill_data *data =3D drvdata;
>> +	int ret;
>>  =20
>>   	switch (psp) {
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +		mutex_lock(&data->charge_type_lock);
>> +
>> +		ret =3D uniwill_write_charge_type(data, val->intval);
>> +		if (ret >=3D 0)
>> +			data->last_charge_type =3D val->intval;
>> +
>> +		mutex_unlock(&data->charge_type_lock);
>> +
>> +		return ret;
>>   	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>>   		if (val->intval < 0 || val->intval > 100)
>>   			return -EINVAL;
>> @@ -1501,21 +1593,41 @@ static int uniwill_property_is_writeable(struct=
 power_supply *psy,
>>   					 const struct power_supply_ext *ext, void *drvdata,
>>   					 enum power_supply_property psp)
>>   {
>> -	if (psp =3D=3D POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
>> +	switch (psp) {
>> +	case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>>   		return true;
>> -
>> -	return false;
>> +	default:
>> +		return false;
>> +	}
>>   }
>>  =20
>> -static const enum power_supply_property uniwill_properties[] =3D {
>> +static const enum power_supply_property uniwill_charge_limit_propertie=
s[] =3D {
>>   	POWER_SUPPLY_PROP_HEALTH,
>>   	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>>   };
>>  =20
>> -static const struct power_supply_ext uniwill_extension =3D {
>> +static const struct power_supply_ext uniwill_charge_limit_extension =
=3D {
>>   	.name =3D DRIVER_NAME,
>> -	.properties =3D uniwill_properties,
>> -	.num_properties =3D ARRAY_SIZE(uniwill_properties),
>> +	.properties =3D uniwill_charge_limit_properties,
>> +	.num_properties =3D ARRAY_SIZE(uniwill_charge_limit_properties),
>> +	.get_property =3D uniwill_get_property,
>> +	.set_property =3D uniwill_set_property,
>> +	.property_is_writeable =3D uniwill_property_is_writeable,
>> +};
>> +
>> +static const enum power_supply_property uniwill_charge_modes_propertie=
s[] =3D {
>> +	POWER_SUPPLY_PROP_CHARGE_TYPES,
>> +	POWER_SUPPLY_PROP_HEALTH,
>> +};
>> +
>> +static const struct power_supply_ext uniwill_charge_modes_extension =
=3D {
>> +	.name =3D DRIVER_NAME,
>> +	.charge_types =3D BIT(POWER_SUPPLY_CHARGE_TYPE_TRICKLE) |
>> +			BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
>> +			BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE),
>> +	.properties =3D uniwill_charge_modes_properties,
>> +	.num_properties =3D ARRAY_SIZE(uniwill_charge_modes_properties),
>>   	.get_property =3D uniwill_get_property,
>>   	.set_property =3D uniwill_set_property,
>>   	.property_is_writeable =3D uniwill_property_is_writeable,
>> @@ -1531,7 +1643,13 @@ static int uniwill_add_battery(struct power_supp=
ly *battery, struct acpi_battery
>>   	if (!entry)
>>   		return -ENOMEM;
>>  =20
>> -	ret =3D power_supply_register_extension(battery, &uniwill_extension, =
data->dev, data);
>> +	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMI=
T))
>> +		ret =3D power_supply_register_extension(battery, &uniwill_charge_lim=
it_extension,
>> +						      data->dev, data);
>> +	else
>> +		ret =3D power_supply_register_extension(battery, &uniwill_charge_mod=
es_extension,
>> +						      data->dev, data);
>> +
>>   	if (ret < 0) {
>>   		kfree(entry);
>>   		return ret;
>> @@ -1560,7 +1678,10 @@ static int uniwill_remove_battery(struct power_s=
upply *battery, struct acpi_batt
>>   		}
>>   	}
>>  =20
>> -	power_supply_unregister_extension(battery, &uniwill_extension);
>> +	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMI=
T))
>> +		power_supply_unregister_extension(battery, &uniwill_charge_limit_ext=
ension);
>> +	else
>> +		power_supply_unregister_extension(battery, &uniwill_charge_modes_ext=
ension);
>>  =20
>>   	return 0;
>>   }
>> @@ -1570,27 +1691,36 @@ static int uniwill_battery_init(struct uniwill_=
data *data)
>>   	unsigned int value, threshold;
>>   	int ret;
>>  =20
>> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>> -		return 0;
>> +	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMI=
T)) {
>> +		ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
>> +		if (ret < 0)
>> +			return ret;
>>  =20
>> -	ret =3D regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &value);
>> -	if (ret < 0)
>> -		return ret;
>> +		/*
>> +		 * The charge control threshold might be initialized with 0 by
>> +		 * the EC to signal that said threshold is uninitialized. We thus
>> +		 * need to replace this value with 100 to signal that we want to
>> +		 * take control of battery charging. For the sake of completeness
>> +		 * we also set the charging threshold to 100 if the EC-provided
>> +		 * value is invalid.
>> +		 */
>> +		threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
>> +		if (threshold =3D=3D 0 || threshold > 100) {
>> +			FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>> +			ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
>> +			if (ret < 0)
>> +				return ret;
>> +		}
>> +	} else if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHAR=
GE_MODES)) {
>> +		ret =3D devm_mutex_init(data->dev, &data->charge_type_lock);
>> +		if (ret < 0)
>> +			return ret;
>>  =20
>> -	/*
>> -	 * The charge control threshold might be initialized with 0 by
>> -	 * the EC to signal that said threshold is uninitialized. We thus
>> -	 * need to replace this value with 100 to signal that we want to
>> -	 * take control of battery charging. For the sake of completeness
>> -	 * we also set the charging threshold to 100 if the EC-provided
>> -	 * value is invalid.
>> -	 */
>> -	threshold =3D FIELD_GET(CHARGE_CTRL_MASK, value);
>> -	if (threshold =3D=3D 0 || threshold > 100) {
>> -		FIELD_MODIFY(CHARGE_CTRL_MASK, &value, 100);
>> -		ret =3D regmap_write(data->regmap, EC_ADDR_CHARGE_CTRL, value);
>> +		ret =3D uniwill_read_charge_type(data, &data->last_charge_type);
>>   		if (ret < 0)
>>   			return ret;
>> +	} else {
>> +		return 0;
>>   	}
>>  =20
>>   	ret =3D devm_mutex_init(data->dev, &data->battery_lock);
>> @@ -1609,10 +1739,13 @@ static int uniwill_notifier_call(struct notifie=
r_block *nb, unsigned long action
>>   {
>>   	struct uniwill_data *data =3D container_of(nb, struct uniwill_data, =
nb);
>>   	struct uniwill_battery_entry *entry;
>> +	int ret;
>>  =20
>>   	switch (action) {
>>   	case UNIWILL_OSD_BATTERY_ALERT:
>> -		if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>> +		if (!uniwill_device_supports_any(data,
>> +						 UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>> +						 UNIWILL_FEATURE_BATTERY_CHARGE_MODES))
>>   			return NOTIFY_DONE;
>>  =20
>>   		mutex_lock(&data->battery_lock);
>> @@ -1623,10 +1756,24 @@ static int uniwill_notifier_call(struct notifie=
r_block *nb, unsigned long action
>>  =20
>>   		return NOTIFY_OK;
>>   	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>> -		if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIOR=
ITY))
>> +		if (!uniwill_device_supports_any(data,
>> +						 UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>> +						 UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>   			return NOTIFY_DONE;
>>  =20
>> -		return notifier_from_errno(usb_c_power_priority_restore(data));
>> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MOD=
ES)) {
>> +			ret =3D uniwill_restore_charge_type(data);
>> +			if (ret < 0)
>> +				return notifier_from_errno(ret);
>> +		}
>> +
>> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORI=
TY)) {
>> +			ret =3D usb_c_power_priority_restore(data);
>> +			if (ret < 0)
>> +				return notifier_from_errno(ret);
>> +		}
>> +
>> +		return NOTIFY_OK;
>>   	case UNIWILL_OSD_FN_LOCK:
>>   		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>>   			return NOTIFY_DONE;
>> @@ -1810,7 +1957,7 @@ static int uniwill_suspend_touchpad_toggle(struct=
 uniwill_data *data)
>>  =20
>>   static int uniwill_suspend_battery(struct uniwill_data *data)
>>   {
>> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIM=
IT))
>>   		return 0;
>>  =20
>>   	/*
>> @@ -1887,11 +2034,15 @@ static int uniwill_resume_touchpad_toggle(struc=
t uniwill_data *data)
>>  =20
>>   static int uniwill_resume_battery(struct uniwill_data *data)
>>   {
>> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>> -		return 0;
>>  =20
>> -	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_C=
TRL_MASK,
>> -				  data->last_charge_ctrl);
>> +	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_MODE=
S))
>> +		return uniwill_restore_charge_type(data);
>> +
>> +	if (uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY_CHARGE_LIMI=
T))
>> +		return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_=
CTRL_MASK,
>> +					  data->last_charge_ctrl);
>> +
>> +	return 0;
>>   }
>>  =20
>>   static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
>> @@ -1970,7 +2121,7 @@ static struct platform_driver uniwill_driver =3D =
{
>>  =20
>>   static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor =
__initdata =3D {
>>   	.features =3D UNIWILL_FEATURE_SUPER_KEY |
>> -		    UNIWILL_FEATURE_BATTERY |
>> +		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>   		    UNIWILL_FEATURE_CPU_TEMP |
>>   		    UNIWILL_FEATURE_GPU_TEMP |
>>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>> @@ -1981,7 +2132,7 @@ static struct uniwill_device_descriptor lapac71h_=
descriptor __initdata =3D {
>>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>>   		    UNIWILL_FEATURE_SUPER_KEY |
>>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>> -		    UNIWILL_FEATURE_BATTERY |
>> +		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>   		    UNIWILL_FEATURE_CPU_TEMP |
>>   		    UNIWILL_FEATURE_GPU_TEMP |
>>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>> @@ -1993,7 +2144,7 @@ static struct uniwill_device_descriptor lapkc71f_=
descriptor __initdata =3D {
>>   		    UNIWILL_FEATURE_SUPER_KEY |
>>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>>   		    UNIWILL_FEATURE_LIGHTBAR |
>> -		    UNIWILL_FEATURE_BATTERY |
>> +		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>>   		    UNIWILL_FEATURE_CPU_TEMP |
>>   		    UNIWILL_FEATURE_GPU_TEMP |
>>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>> @@ -2579,7 +2730,7 @@ static int __init uniwill_init(void)
>>  =20
>>   	if (force) {
>>   		/* Assume that the device supports all features except the charge l=
imit */
>> -		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY;
>> +		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_C=
HARGE_LIMIT;
>>   		pr_warn("Enabling potentially unsupported features\n");
>>   	}
>>  =20
>> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platf=
orm/x86/uniwill/uniwill-wmi.c
>> index 31d9c39f14ab..f1b89bc63df6 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
>> @@ -48,6 +48,7 @@ int devm_uniwill_wmi_register_notifier(struct device =
*dev, struct notifier_block
>>   static void uniwill_wmi_notify(struct wmi_device *wdev, union acpi_ob=
ject *obj)
>>   {
>>   	u32 value;
>> +	int ret;
>>  =20
>>   	if (obj->type !=3D ACPI_TYPE_INTEGER)
>>   		return;
>> @@ -56,7 +57,9 @@ static void uniwill_wmi_notify(struct wmi_device *wde=
v, union acpi_object *obj)
>>  =20
>>   	dev_dbg(&wdev->dev, "Received WMI event %u\n", value);
>>  =20
>> -	blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, NULL);
>> +	ret =3D blocking_notifier_call_chain(&uniwill_wmi_chain_head, value, =
NULL);
>> +	if (notifier_to_errno(ret) < 0)
>> +		dev_err(&wdev->dev, "Failed to handle event %u\n", value);
>>   }
>>  =20
>>   /*
>>
>=20

