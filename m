From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: i2c-multi-instantiate: Derive the device
 name from parent
Date: Fri, 20 Sep 2019 12:32:22 +0200
Message-ID: <cde45562-af19-77e9-b3c9-7b3eb7dcd459@redhat.com>
References: <20190920100233.12829-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190920100233.12829-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 9/20/19 12:02 PM, Heikki Krogerus wrote:
> When naming the new devices, instead of using the ACPI ID in
> the name as base, using the parent device's name. That makes
> it possible to support multiple multi-instance i2c devices
> of the same type in the same system.
>=20
> This fixes an issue seen on some Intel Kaby Lake based
> boards:
>=20
> sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:15.0=
/i2c_designware.0/i2c-0/i2c-INT3515-tps6598x.0'
>=20
> Fixes: 2336dfadfb1e ("platform/x86: i2c-multi-instantiate: Allow to have =
same slaves")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/i2c-multi-instantiate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platf=
orm/x86/i2c-multi-instantiate.c
> index 61fe341a85aa..ea68f6ed66ae 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -90,7 +90,7 @@ static int i2c_multi_inst_probe(struct platform_device =
*pdev)
>   =09for (i =3D 0; i < multi->num_clients && inst_data[i].type; i++) {
>   =09=09memset(&board_info, 0, sizeof(board_info));
>   =09=09strlcpy(board_info.type, inst_data[i].type, I2C_NAME_SIZE);
> -=09=09snprintf(name, sizeof(name), "%s-%s.%d", match->id,
> +=09=09snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
>   =09=09=09 inst_data[i].type, i);
>   =09=09board_info.dev_name =3D name;
>   =09=09switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
>=20
