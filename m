From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH v2] acer-wmi: No wifi rfkill on Lenovo machines
Date: Mon, 06 Feb 2012 19:04:13 +0800
Message-ID: <4F2FB3AD.5030203@canonical.com>
References: <4F3040700200002300007E4A@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:37417 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502Ab2BFLE0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Feb 2012 06:04:26 -0500
In-Reply-To: <4F3040700200002300007E4A@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@suse.com>
Cc: corentincj@iksaif.net, dtor@mail.ru, mjg@redhat.com, carlos@strangeworlds.co.uk, trenn@suse.de, platform-driver-x86@vger.kernel.org

Thanks.

I work with bug reporter at

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/875659

and also got a report of successful test which is at

  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/875659/comments/=
65


On 02/06/2012 06:04 PM, Joey Lee wrote:
> Hi Ike,=20
>=20
> =E6=96=BC =E4=BA=94=EF=BC=8C2012-02-03 =E6=96=BC 16:46 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>> We have several reports which says acer-wmi is loaded on ideapads
>> and register rfkill for wifi which can not be unblocked.
>>
>> Since ideapad-laptop also register rfkill for wifi and it works
>> reliably, it will be fine acer-wmi is not going to register rfkill
>> for wifi once VPC2004 is found.
>>
>> Also put IBM0068/LEN0068 in the list. Though thinkpad_acpi has no
>> wifi rfkill capability, there are reports which says acer-wmi also
>> block wireless on Thinkpad E520/E420.
>>
>> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
>=20
> Thanks for your patch, it's good to me after tested.
>=20
>=20
> Tested on Acer TravelMate 4750.
>=20
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
>=20
>=20
> Thanks a lot!
> Joey Lee
>=20
>> ---
>>  drivers/platform/x86/acer-wmi.c |   30 ++++++++++++++++++++++++++++=
+-
>>  1 files changed, 29 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/=
acer-wmi.c
>> index b848277..1e5290b 100644
>> --- a/drivers/platform/x86/acer-wmi.c
>> +++ b/drivers/platform/x86/acer-wmi.c
>> @@ -679,6 +679,32 @@ static acpi_status AMW0_find_mailled(void)
>>  	return AE_OK;
>>  }
>> =20
>> +static int AMW0_set_cap_acpi_check_device_found;
>> +
>> +static acpi_status AMW0_set_cap_acpi_check_device_cb(acpi_handle ha=
ndle,
>> +	u32 level, void *context, void **retval)
>> +{
>> +	AMW0_set_cap_acpi_check_device_found =3D 1;
>> +	return AE_OK;
>> +}
>> +
>> +static const struct acpi_device_id norfkill_ids[] =3D {
>> +	{ "VPC2004", 0},
>> +	{ "IBM0068", 0},
>> +	{ "LEN0068", 0},
>> +	{ "", 0},
>> +};
>> +
>> +static int AMW0_set_cap_acpi_check_device(void)
>> +{
>> +	const struct acpi_device_id *id;
>> +
>> +	for (id =3D norfkill_ids; id->id[0]; id++)
>> +		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
>> +				NULL, NULL);
>> +	return AMW0_set_cap_acpi_check_device_found;
>> +}
>> +
>>  static acpi_status AMW0_set_capabilities(void)
>>  {
>>  	struct wmab_args args;
>> @@ -692,7 +718,9 @@ static acpi_status AMW0_set_capabilities(void)
>>  	 * work.
>>  	 */
>>  	if (wmi_has_guid(AMW0_GUID2)) {
>> -		interface->capability |=3D ACER_CAP_WIRELESS;
>> +		if ((quirks !=3D &quirk_unknown) ||
>> +		    !AMW0_set_cap_acpi_check_device())
>> +			interface->capability |=3D ACER_CAP_WIRELESS;
>>  		return AE_OK;
>>  	}
>> =20
>=20
>=20
>=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
