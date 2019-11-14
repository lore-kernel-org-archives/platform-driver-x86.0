From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v7 2/8] efi: Add embedded peripheral firmware support
Date: Thu, 14 Nov 2019 12:27:01 +0100
Message-ID: <e7bd40ff-20d1-3aed-8516-9fffd4c3a207@redhat.com>
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-3-hdegoede@redhat.com>
 <20191011144834.GL16384@42.do-not-panic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191011144834.GL16384@42.do-not-panic.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Luis,

Thank you for the reviews and sorry for being a bit slow to respind.

On 11-10-2019 16:48, Luis Chamberlain wrote:
> On Fri, Oct 04, 2019 at 04:50:50PM +0200, Hans de Goede wrote:
>> +static int __init efi_check_md_for_embedded_firmware(
>> +=09efi_memory_desc_t *md, const struct efi_embedded_fw_desc *desc)
>> +{
>> +=09const u64 prefix =3D *((u64 *)desc->prefix);
>> +=09struct sha256_state sctx;
>> +=09struct embedded_fw *fw;
>> +=09u8 sha256[32];
>> +=09u64 i, size;
>> +=09void *map;
>> +
>> +=09size =3D md->num_pages << EFI_PAGE_SHIFT;
>> +=09map =3D memremap(md->phys_addr, size, MEMREMAP_WB);
>=20
> Since our limitaiton is the init process must have mostly finished,
> it implies early x86 boot code cannot use this, what measures can we
> take to prevent / check for such conditions to be detected and
> gracefully errored out?

As with all (EFI) early boot code, there simply is a certain order
in which things need to be done. This needs to happen after the basic
mm is setup, but before efi_free_boot_services() gets called, there
isn't really a way to check for all these conditions. As with all
early boot code, people making changes need to be careful to not
break stuff.

>=20
>> +=09if (!map) {
>> +=09=09pr_err("Error mapping EFI mem at %#llx\n", md->phys_addr);
>> +=09=09return -ENOMEM;
>> +=09}
>> +
>> +=09size -=3D desc->length;
>=20
> Remind me again, why we decrement the size here?

Basically this is another way of writing:

=09for (i =3D 0; (i + desc->length) < size; i +=3D 8) {

> I was going to ask if we didn't need a:
>=20
> if (desc->length > size) {
> =09memunmap(map);
> =09return -EINVAL;
> }

That is a good point, unlikely but still a good point,
so I guess that writing:

=09for (i =3D 0; (i + desc->length) < size; i +=3D 8) {

Instead would better as that avoids the need for that check.
I will fix this for the next version.

Regards,

Hans

>=20
>> +=09for (i =3D 0; i < size; i +=3D 8) {
>> +=09=09u64 *mem =3D map + i;
>> +
>> +=09=09if (*mem !=3D prefix)
>> +=09=09=09continue;
>> +
>> +=09=09sha256_init(&sctx);
>> +=09=09sha256_update(&sctx, map + i, desc->length);
>> +=09=09sha256_final(&sctx, sha256);
>> +=09=09if (memcmp(sha256, desc->sha256, 32) =3D=3D 0)
>> +=09=09=09break;
>> +=09}
>> +=09if (i >=3D size) {
>> +=09=09memunmap(map);
>> +=09=09return -ENOENT;
>> +=09}
>> +
>> +=09pr_info("Found EFI embedded fw '%s'\n", desc->name);
>=20
> Otherwise looks good.
>=20
>    Luis
>=20
