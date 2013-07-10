From: Shuah Khan <shuah.kh@samsung.com>
Subject: Re: [tpmdd-devel] [PATCH 3/4] tpm: Convert tpm_tis driver to use
 dev_pm_ops from legacy pm_ops
Date: Wed, 10 Jul 2013 23:02:45 +0000
Message-ID: <B8EFE96D1287C24090BAD9D858E15E61738933@sisaex02sj>
References: <1373429409-3944-1-git-send-email-shuah.kh@samsung.com>
 <201307110051.04726.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>
Cc: "tpmdd-devel@lists.sourceforge.net" <tpmdd-devel@lists.sourceforge.net>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "key@linux.vnet.ibm.com" <key@linux.vnet.ibm.com>, "mail@srajiv.net" <mail@srajiv.net>, "tpmdd@selhorst.net" <tpmdd@selhorst.net>, "tpmdd@sirrix.com" <tpmdd@sirrix.com>, "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "shuahkhan@gmail.com" <shuahkhan@gmail.com>, Shuah Khan <shuah.kh@samsung.com>
List-Id: platform-driver-x86.vger.kernel.org

On 07/10/2013 04:43 PM, Peter H=FCwe wrote:
> Hi,
>
> thanks for your patch
>>   static struct pnp_device_id tpm_pnp_tbl[] =3D {
>>   	{"PNP0C31", 0},		/* TPM */
>>   	{"ATM1200", 0},		/* Atmel */
>> @@ -835,9 +834,12 @@ static struct pnp_driver tis_pnp_driver =3D {
>>   	.name =3D "tpm_tis",
>>   	.id_table =3D tpm_pnp_tbl,
>>   	.probe =3D tpm_tis_pnp_init,
>> -	.suspend =3D tpm_tis_pnp_suspend,
>> -	.resume =3D tpm_tis_pnp_resume,
>>   	.remove =3D tpm_tis_pnp_remove,
>> +#ifdef CONFIG_PM_SLEEP
>> +	.driver	=3D {
>> +		.pm =3D &tpm_tis_pm,
>> +	},
>> +#endif
>>   };
>
>
> I don't think the #if CONFIG_PM_SLEEP is required here.
>
> Thanks,
> Peter
>

tpm_tis_resume() is defined originally in CONFIG_PM_SLEEP scope. I can=20
make the change to have tpm_tis_resume() not be in CONFIG_PM_SLEEP scop=
e=20
and remove this CONFIG_PM_SLEEP when defining .pm. That does make sense=
=20
looking at tpm_pm_suspend() and tpm_pm_resume() which are defined=20
without CONFIG_PM_SLEEP scope. Sounds like the right approach? I will=20
redo the patch and send v2.

I find that the use of CONFIG_PM, CONFIG_PM_SLEEP, and CONFIG_PM_RUNTIM=
E=20
are not very consistent. :)

-- Shuah

Shuah Khan, Linux Kernel Developer - Open Source Group Samsung Research=
=20
America (Silicon Valley) shuah.kh@samsung.com | (970) 672-0658
