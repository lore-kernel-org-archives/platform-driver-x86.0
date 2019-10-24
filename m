From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH resend] Add touchscreen platform data for the Schneider
 SCT101CTM tablet
Date: Thu, 24 Oct 2019 10:09:41 +0200
Message-ID: <1274f8b7-234b-1af4-0715-b47018d96946@redhat.com>
References: <20191023185323.13552-1-hdegoede@redhat.com>
 <CAHp75VfhKzXfJEwHLdkwJHPXmL6bCRMtvo-0aCSQxdiHQyXHHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfhKzXfJEwHLdkwJHPXmL6bCRMtvo-0aCSQxdiHQyXHHQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Gorbea Ainz <danielgorbea@hotmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 23-10-2019 21:08, Andy Shevchenko wrote:
> On Wed, Oct 23, 2019 at 9:53 PM Hans de Goede <hdegoede@redhat.com> wrote=
:
>>
>> From: Daniel Gorbea Ainz <danielgorbea@hotmail.com>
>>
>> Add touchscreen platform data for the Schneider SCT101CTM tablet
>=20
> Thanks, now patchwork sees it.
>=20
>> Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>
>=20
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>=20
> I'm not sure you need to put Rb when you have your SoB.
> Do you think it's fine if I remove Rb when applying?

I believe having a r-b here is fine, but if you want to remove
it that is fine with me too.

Regards,

Hans




>=20
>> ---
>> hdegoede: Resend from my email address as vger.kernel.org does not like
>> Daniel's emails
>> ---
>>   drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x=
86/touchscreen_dmi.c
>> index 8bfef880e216..ba494ace83d4 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -549,6 +549,24 @@ static const struct ts_dmi_data pov_mobii_wintab_p1=
006w_v10_data =3D {
>>          .properties     =3D pov_mobii_wintab_p1006w_v10_props,
>>   };
>>
>> +static const struct property_entry schneider_sct101ctm_props[] =3D {
>> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
>> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
>> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
>> +       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>> +       PROPERTY_ENTRY_STRING("firmware-name",
>> +                             "gsl1680-schneider-sct101ctm.fw"),
>> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
>> +       { }
>> +};
>> +
>> +static const struct ts_dmi_data schneider_sct101ctm_data =3D {
>> +       .acpi_name      =3D "MSSL1680:00",
>> +       .properties     =3D schneider_sct101ctm_props,
>> +};
>> +
>>   static const struct property_entry teclast_x3_plus_props[] =3D {
>>          PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>>          PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
>> @@ -968,6 +986,14 @@ const struct dmi_system_id touchscreen_dmi_table[] =
=3D {
>>                          DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>>                  },
>>          },
>> +       {
>> +               /* Schneider SCT101CTM */
>> +               .driver_data =3D (void *)&schneider_sct101ctm_data,
>> +               .matches =3D {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
>> +               },
>> +       },
>>          {
>>                  /* Teclast X3 Plus */
>>                  .driver_data =3D (void *)&teclast_x3_plus_data,
>> --
>> 2.23.0
>>
>=20
>=20
