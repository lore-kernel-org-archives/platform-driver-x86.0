From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 1/8] efi: Export boot-services code and data as
 debugfs-blobs
Date: Thu, 14 Nov 2019 12:31:18 +0100
Message-ID: <340462a7-462a-3864-64bd-bdac5b428990@redhat.com>
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-2-hdegoede@redhat.com>
 <20191014091133.GY16384@42.do-not-panic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014091133.GY16384@42.do-not-panic.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 14-10-2019 11:11, Luis Chamberlain wrote:
> On Fri, Oct 04, 2019 at 04:50:49PM +0200, Hans de Goede wrote:
>> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
>> index 8d3e778e988b..abba49c4c46d 100644
>> --- a/drivers/firmware/efi/efi.c
>> +++ b/drivers/firmware/efi/efi.c
>> @@ -314,6 +315,55 @@ static __init int efivar_ssdt_load(void)
>>   static inline int efivar_ssdt_load(void) { return 0; }
>>   #endif
>>  =20
>> +#ifdef CONFIG_DEBUG_FS
>> +
>> +#define EFI_DEBUGFS_MAX_BLOBS 32
>> +
>> +static struct debugfs_blob_wrapper debugfs_blob[EFI_DEBUGFS_MAX_BLOBS];
>> +
>> +static void __init efi_debugfs_init(void)
>> +{
>> +=09struct dentry *efi_debugfs;
>> +=09efi_memory_desc_t *md;
>> +=09char name[32];
>> +=09int type_count[EFI_BOOT_SERVICES_DATA + 1] =3D {};
>> +=09int i =3D 0;
>> +
>> +=09efi_debugfs =3D debugfs_create_dir("efi", NULL);
>> +=09if (IS_ERR_OR_NULL(efi_debugfs))
>> +=09=09return;
>> +
>> +=09for_each_efi_memory_desc(md) {
>> +=09=09switch (md->type) {
>> +=09=09case EFI_BOOT_SERVICES_CODE:
>> +=09=09=09snprintf(name, sizeof(name), "boot_services_code%d",
>> +=09=09=09=09 type_count[md->type]++);
>> +=09=09=09break;
>> +=09=09case EFI_BOOT_SERVICES_DATA:
>> +=09=09=09snprintf(name, sizeof(name), "boot_services_data%d",
>> +=09=09=09=09 type_count[md->type]++);
>> +=09=09=09break;
>> +=09=09default:
>> +=09=09=09continue;
>> +=09=09}
>> +
>> +=09=09debugfs_blob[i].size =3D md->num_pages << EFI_PAGE_SHIFT;
>> +=09=09debugfs_blob[i].data =3D memremap(md->phys_addr,
>> +=09=09=09=09=09=09debugfs_blob[i].size,
>> +=09=09=09=09=09=09MEMREMAP_WB);
>> +=09=09if (!debugfs_blob[i].data)
>> +=09=09=09continue;
>> +
>> +=09=09debugfs_create_blob(name, 0400, efi_debugfs, &debugfs_blob[i]);
>> +=09=09i++;
>> +=09=09if (i =3D=3D EFI_DEBUGFS_MAX_BLOBS)
>> +=09=09=09break;
>=20
> Why do we silently ignore more entries ?

A valid remark, I agree that adding a pr_warn_once here would be good
I will do so for the next version.

> And could documentation be
> added for ways in which this could be used in practice?

I can write a little how to use this to get an embedded firmware,
I will add this to firmware/fallback-mechanisms.rst for the next
version.

Regards,

Hans
