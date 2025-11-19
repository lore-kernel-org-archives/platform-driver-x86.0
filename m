Received: from outbound.mr.icloud.com (p-west2-cluster6-host3-snip4-7.eps.apple.com [57.103.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD42ED843
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538399; cv=none; b=elsEtxWbYJd8BNKOFxmSGtqAmNRPz4TY2JzD6pB8xwe0QhBtS8qbwA3i0HpoTo/oKR7P8jbL8CpUmqX36VIHHGhlUdnfGLobARxktLb+/05pJRhGs6vQAq5dq5bkLYF/m+GeFV87fQjn2L0rwUCDH+SKH8T7PmtvEGfd35jXZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538399; c=relaxed/simple;
	bh=6D6zem1vrtClkXmQtUR9tbA3rzHxfyLRB7w/yhqtBXs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OhSs9gkjfeXrQJvheTB3Lzs90JPM/gJhC7A9EdyqtQ38LebosvfGToL88HoHWdMSFJclQLqtrcEIrbGcb0UnZerWQeVs1KntDcZtAvTfCLY/WJoWjt1z2o8XJgrSQrpeK6KNLSOUxSSkwHb9eGGJXa5pFc2ACsHaa7JcP4ijZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=pass smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=sCq1+Xkg; arc=none smtp.client-ip=57.103.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="sCq1+Xkg"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id F359818000A8;
	Wed, 19 Nov 2025 07:46:33 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; s=sig1; bh=5CTVJa0mCQzCyW8rg/pzVrYn6lJ7MlPmazJiuRUSD/0=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=sCq1+XkgiMgC6yBiknMD04TLhHU6Amv1yrp7CuabwQstfqQo6wM41axGi8VmesRyZzDzPPz0CKGZVqH2Oh37+ivRfPfcE6ebA9omE7YdGL2csL0xg0LH2olxUFODmZj0sZTIa2/Hv3gqYNg93lJNZK9V5UAAVQz5ccBDuMwfk8MzWFLu6oz+/OPTZ2jY+J43ZUMA9U8g6oZQaLanx2lDaia7MSpiYcBjydk+msbyJz8yPQ34jxrb7+71N7FZF9Q+V+OgRTlH97pJZre+UoIh2DsXUxi9yCq/Xr43UAdRYEeqUqX3NFm9VHBSd/IRB/qYqarqQgbO3uAwir9TiUSMBg==
mail-alias-created-date: 1566896761000
Received: from smtpclient.apple (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id 8567518001F7;
	Wed, 19 Nov 2025 07:46:32 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.4\))
Subject: Re: [bug report] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
From: luke@ljones.dev
In-Reply-To: <aR1xbxEQyQPEvB9o@stanley.mountain>
Date: Wed, 19 Nov 2025 20:46:20 +1300
Cc: platform-driver-x86@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8438648-F06F-4CA2-9F12-8F9A7258DAEA@ljones.dev>
References: <aR1xbxEQyQPEvB9o@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: Apple Mail (2.3864.300.41.1.4)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA2MCBTYWx0ZWRfX0xDupEQZMEKX
 pe5S/H4lWYRjM4QupMhSXCQ07gdCNoRp/iDXEgGj5Qpv9dHgWH2UXDfsS36pFtO+akhu2epWkTW
 E2mvSZkSYxhuR45l6YJU5fhGO5XGAEmLxih1oFIQ2sHn+0Jep4i0BrpEGWh6kWi00ZooN3I1gtG
 C4WW1dxeJ1DQoMl1rqvpxRxFvKLmdgZr26V0VBiSOOcVHvmlEagVpWP/pLAUlGUENLYVWHw6mRV
 tA7V9NCJ4JfGXvF/42Amjv03ozRHRV82I1COWQjXWRQ17iyIKyjCFk+6mF7epgtQEPYs73jwCZB
 Ka9YgAzT8J0MNgJ8YiM
X-Authority-Info: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=691d75da cx=c_apl:c_pps
 a=9OgfyREA4BUYbbCgc0Y0oA==:117 a=9OgfyREA4BUYbbCgc0Y0oA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=NeKjjCbprkz3aORVak4A:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wD1B3yqxB3cMbcyJQfXZzwx0HvsgBcl9
X-Proofpoint-GUID: wD1B3yqxB3cMbcyJQfXZzwx0HvsgBcl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 clxscore=1030 mlxscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190060
X-JNJ: AAAAAAAB80Am8tSV3SfB7uOerk9eMXPin3DTOWU5T2Ez9X5ZvgTgiM/WDMkmfHuQaMCEDbVAAM7jTP70YPxeK8BnlM608IdPjt+nCLvpWnDajyNHTQykAaH5K70217vGWXkAqeZvXWx+hHEKmHJq98vlrctb+A5pAQ1mbUhWqY3AcJ6dg09ZLJ2vZmB6Gtw4JFniFtIvWyARbCRpTFF15CUMVYlv6oFTPL1XKAMOsyb/etHC+705adMGeff4ldXFgjMCvEFN9VWX90yKPVOyWSEEu4I03zbuJ+QTLa02rK5cdlQvJVFrbzaGYjpg/SmCUqV8NbEEPToc4RLHjdz500sFexhLfG6rYhOGSbugKAUQVcmSFTtqASQKxNoWaF8sxwAEFagjIvy7hPdNpkXdqeGyBsmgSQndRRJQ53D+at7nbbpGnHysV6TkGXVVLcwNfnJ5ZWIm70JbznEKHbO3WVcZFq9HpkNAz4GoO81KiDGufd/jmXHBX+LSE15/9UknFiS4VcpfKc7dnAs3CATbR2vk4bfTIu4kT0KnAdsDMiJ/DIEvfe+KgKm5XprvX7JX32ToxrEPa2PO+A/rFV0atMbxv76ek55IkKnrNXqoCfT/+sNlPg==

I=E2=80=99m not working on this. CCing Denis.

> On 19 Nov 2025, at 20:27, Dan Carpenter <dan.carpenter@linaro.org> =
wrote:
>=20
> Hello Luke D. Jones,
>=20
> Commit f99eb098090e ("platform/x86: asus-armoury: move existing
> tunings to asus-armoury module") from Nov 2, 2025 (linux-next), leads
> to the following Smatch static checker warning:
>=20
> 	drivers/platform/x86/asus-armoury.c:429 =
mini_led_mode_current_value_show()
> 	warn: iterator 'i' not incremented
>=20
> drivers/platform/x86/asus-armoury.c
>    399 static ssize_t mini_led_mode_current_value_show(struct kobject =
*kobj,
>    400                                                 struct =
kobj_attribute *attr, char *buf)
>    401 {
>    402         u32 *mini_led_mode_map;
>    403         size_t mini_led_mode_map_size;
>    404         u32 i, mode;
>    405         int err;
>    406=20
>    407         switch (asus_armoury.mini_led_dev_id) {
>    408         case ASUS_WMI_DEVID_MINI_LED_MODE:
>    409                 mini_led_mode_map =3D mini_led_mode1_map;
>    410                 mini_led_mode_map_size =3D =
ARRAY_SIZE(mini_led_mode1_map);
>    411                 break;
>    412=20
>    413         case ASUS_WMI_DEVID_MINI_LED_MODE2:
>    414                 mini_led_mode_map =3D mini_led_mode2_map;
>    415                 mini_led_mode_map_size =3D =
ARRAY_SIZE(mini_led_mode2_map);
>    416                 break;
>    417=20
>    418         default:
>    419                 pr_err("Unrecognized mini-LED device: %u\n", =
asus_armoury.mini_led_dev_id);
>    420                 return -ENODEV;
>    421         }
>    422=20
>    423         err =3D armoury_get_devstate(attr, &mode, =
asus_armoury.mini_led_dev_id);
>    424         if (err)
>    425                 return err;
>    426=20
>    427         mode =3D FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
>    428=20
> --> 429         for (i =3D 0; i < mini_led_mode_map_size; i++)
>    430                 return sysfs_emit(buf, "%u\n", =
mini_led_mode_map[i]);
>=20
> This loop doesn't make sense.  It just prints the first element in
> the mini_led_mode_map[] array and returns.
>=20
>    431=20
>    432         pr_warn("Unrecognized mini-LED mode: %u", mode);
>    433         return -EINVAL;
>    434 }
>=20
> regards,
> dan carpenter

