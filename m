From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 2/6] platform/x86: huawei-wmi: Add quirks and module
 parameters
Date: Fri, 20 Sep 2019 09:24:08 +0200
Message-ID: <30a363e5-5691-e008-e1e5-55936fa3cd92@redhat.com>
References: <20190920003938.21617-1-ayman.bagabas@gmail.com>
 <20190920003938.21617-3-ayman.bagabas@gmail.com>
 <20190920060812.GB473898@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920060812.GB473898@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sinan Kaya <okaya@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Takashi Iwai <tiwai@suse.de>, Stuart Hayes <stuart.w.hayes@gmail.com>, Matan Ziv-Av <matan@svgalib.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Peng Hao <peng.hao2@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 20-09-2019 08:08, Greg Kroah-Hartman wrote:
> On Thu, Sep 19, 2019 at 08:39:07PM -0400, Ayman Bagabas wrote:
>> Introduce quirks and module parameters. 3 quirks are added:
>> 1. Fixes reporting brightness keys twice since it's already handled by
>>     acpi-video.
>> 2. Some models need a short delay when setting battery thresholds to
>>     prevent a race condition when two processes read/write. (will be use=
d later)
>> 3. Matebook X (2017) handles micmute led through the "legacy" interface
>>     which is not currently implemented. Use ACPI EC method to control
>>     this led. (will be used later)
>>
>> 2 module parameters are added to enable this short delay and/or report
>>    brightness keys through this driver.
>=20
> module parameters are a pain to manage and handle over time.  Is there
> any way you can "automatically" figure this out, or use a sysfs file
> instead?

The patch also adds dmi matches to set the quirks, so the module params
are there to override those and/or to easily test which are the right optio=
ns
with new modules. The normal / expected use-case for everything to be set
automatically based on the DMI table.

With that said, the module-params should really always override the dmi val=
ues,
so I would like to suggest to make the module-params int-s instead of bool-=
s
and to do something like this:

static int battery_reset =3D -1;
static int report_brightness =3D -1;

=09quirks =3D &quirk_unknown;
=09dmi_check_system(huawei_quirks);
=09/* If set the module options override the vale from the DMI table */
=09if (battery_reset !=3D -1)
=09=09quirks->battery_reset =3D battery_reset;
=09if (report_brightness !=3D -1)
=09=09quirks->report_brightness =3D report_brightness;

Regards,

Hans
