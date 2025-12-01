Received: from outbound.ms.icloud.com (p-west3-cluster4-host6-snip4-5.eps.apple.com [57.103.74.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CBB1369B4
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Dec 2025 05:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764566233; cv=none; b=QxzLQuVyVWKC6hznUf36A6HZ/1gw3FY3bLcMUl6MBSPMOqJkiaWNQPscKSBPzucCZfq7IgF6jDBdYJ9gIx5uQPQ5n8ip35Uq1KkF9PPhC+AymhOyzHJRYhOnA47Q5yi1aUZQrEaCuBTXFk0p0x2ORMSf+q8oKu35j4TBqbtPA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764566233; c=relaxed/simple;
	bh=p7ObJ5luw73K5ZHJVMR8UDSCgSlI0nnWDFPmJQN3638=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GohZSMOsEk31xiC0ETFOcndLYI2MkSXWYCN3sAoEdoUfU2WGt6ZdIZ0wurJr49foj3HN/RgB6S6PFgvVDvivnV59jvpNkBZ3ZGRR111iiFOGmXEbpyXlS1WYgJiXpRhCSCOSpfZSpJLZUlT4avYuAVL+ft6A7U7umlcdNXZlGgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=uMuIKU2M; arc=none smtp.client-ip=57.103.74.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="uMuIKU2M"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPS id EDE76180041F;
	Mon,  1 Dec 2025 05:17:08 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=5n0Fb3P/Ch8j1L62s/ktD92R1Va79GOyMRDUhITIJv4=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=uMuIKU2M2+N4FTBhsyZLErkW7KcN8ysjCDltpvsHwb+R1im1QISBgrZjWghFE8jP6IrdhjaNsQ2BXwvWDd1c+vGnlUbcvWNNgmf34okUiewGh57OOqHN1rsip/iTeDG9RwcoBzySmN44uMYBCflZbZc8dBbYXLNcDOnWlAsHqQk842gjVNWthlWtQk9Oyly29Opm3U0vuvGBsFNIxegRoIPI+cgjMEplYkaFnpt1R1aj3ZJnZi3txWiIj6siTrPk4tWZ2NWMJWZBCq8id0RQzFKFEodgcstIpuuqQjmaG+xMejXYogH7Op3K+8L3EzeK2KWMdlxvSa2iTm7LS0Wm+A==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPSA id 579731800123;
	Mon,  1 Dec 2025 05:17:07 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.4\))
Subject: Re: [bug report] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
From: luke@ljones.dev
In-Reply-To: <aSRHRCgoKxxmw4bt@stanley.mountain>
Date: Mon, 1 Dec 2025 18:16:54 +1300
Cc: platform-driver-x86@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4088470D-AB3A-42CF-94DE-98C687019E9A@ljones.dev>
References: <aSRHRCgoKxxmw4bt@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: Apple Mail (2.3864.300.41.1.4)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA0MCBTYWx0ZWRfXwaFEN9AL403S
 /H+peNvcoj5Pe/tcneUTriIcauaB3tIAI5DAsxOvGfp/VQYHE6lUY6nTQkpHTghMHyc5d2XBzzE
 72IwbqO/sypq109zMm7U7d7QIDtLvqdMH6ILrNL5Es2JWTe5KLrrfa35cBTYvj99kTaXPDNXdp3
 f7zPmcdtXZ2n/uzrs701WW0fImb3Hb7xqEirEROkHGt4ZaclJIhncOJLmhoDETNETHXsah6CkUG
 mL87SbVbS8dzClToevybn84MSvgNz1GAv4nqTXpEszBpf9kRo3QwubunZXy8/8XmO9636F1mUg9
 6/hovEdL9MvoT1ZI6fa
X-Authority-Info: v=2.4 cv=O7Y0fR9W c=1 sm=1 tr=0 ts=692d24d5 cx=c_apl:c_pps
 a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=lfvccEoxsv91OX8_wu4A:9
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HZMvgOFdedtWbRfBsyLjFd7kYvd6Zccj
X-Proofpoint-GUID: HZMvgOFdedtWbRfBsyLjFd7kYvd6Zccj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1030 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010040
X-JNJ: AAAAAAAB67FpoE0ltsSxPSsijr8gJSuiEvbdHH5VMxG9q5ylGdpGZNAuqQckXFebpcYde8EPwnNvb3fYcut85Pep2TX3tKUsmU0uIOfigzECWTlB+NL8lnhY90o8ZRvp+5NBoK5IhUzs5BicwUl/k4gqwe3Ce0/Pk4SXFeHL6n024taMkTblQNUioOf2plqb5eM0XhEEyA5ydvEBaQpa21fieh7w80SknzQ2MbxFwiB7lesACu9fQgtqWPade69BtZ2h1D2QeAiiOwwk2wmrUHiuR2cqmU3o1gK73/tO2u744UbUWUbSS7YKCIWm4hB7pp+Xz5up5tim1m75nuU0H+Z4iFqLdLPZFd+xQymBU+Smh2H9HzO5n28Wz33ZoYDHV95P2FGLt8dbKD04lKcQQA9db+/NY/BsdLX5gc7WICoaZv2YktitIp6TZiSIRFWqBZeZD5MyhJhzLxMpHTAlheDWXb22jJZ7Rk4+aD+QW6kN9h8hL6EhH57fe61DTp+K04sULdRB9Snb/JWCqErHmbl0qxlh/PPHhHIe0NFP422YmxUJw2vSlLkHDxLo2rt1LZPzeN+Y4+3VKreiIN9X9e+C1zEzFTBTXCTTeP/pRIg=

Thank you. As I have not been working on this driver and Denis is taking =
over I will CC him.

> On 25 Nov 2025, at 00:53, Dan Carpenter <dan.carpenter@linaro.org> =
wrote:
>=20
> Hello Luke D. Jones,
>=20
> Commit f99eb098090e ("platform/x86: asus-armoury: move existing
> tunings to asus-armoury module") from Nov 2, 2025 (linux-next), leads
> to the following Smatch static checker warning:
>=20
> drivers/platform/x86/asus-armoury.c:147 armoury_has_devstate()
> error: uninitialized symbol 'retval'.
>=20
> drivers/platform/x86/asus-armoury.c
>    141 static bool armoury_has_devstate(u32 dev_id)
>    142 {
>    143         u32 retval;
>    144         int status;
>    145=20
>    146         status =3D =
asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, &retval);
> --> 147         pr_debug("%s called (0x%08x), retval: 0x%08x\n", =
__func__, dev_id, retval);
>                                                                        =
           ^^^^^^
> "retval" is uninitialized if asus_wmi_evaluate_method() returns =
negative.
>=20
>    148=20
>    149         return status =3D=3D 0 && (retval & =
ASUS_WMI_DSTS_PRESENCE_BIT);
>    150 }
>=20
> regards,
> dan carpenter

