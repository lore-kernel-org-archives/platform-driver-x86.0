From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
Date: Wed, 18 Sep 2019 22:12:43 +0200
Message-ID: <029c7865-b9b3-1e58-7092-6d8495de0116@redhat.com>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
 <f578a65b-af02-5fe8-dd59-9918c000da64@redhat.com>
 <20190918114224.GA23318@jeknote.loshitsa1.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918114224.GA23318@jeknote.loshitsa1.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 18-09-2019 13:42, Yauhen Kharuzhy wrote:
> On Wed, Sep 18, 2019 at 11:20:21AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 17-09-2019 21:45, Yauhen Kharuzhy wrote:
>>> Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
>>> hardware has TypeC connector and register related devices described as
>>> I2C connections in the _CRS resource.
>>>
>>> There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with micro
>>> USB B connector exists. It has INT33FE device in the DSDT table but
>>> there are only two I2C connection described: PMIC and BQ27452 battery
>>> fuel gauge.
>>>
>>> Splitting existing INT33FE driver allow to maintain code for USB type B
>>> (AB) connector variant separately and make it simpler.
>>>
>>> Split driver to intel_cht_int33fe_common.c and
>>> intel_cht_int33fe_{typeb,typec}.c. Compile all this source to one .ko
>>> module to make user experience easier.
>>>
>>> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
>>
>> Thank you for doing this, this version looks much better IMHO.
>>
>> Note that this does not apply to Linus' current master, please
>> rebase. Specifically this conflicts with this patch:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D78cd4bf53635d3aeb73435bc89eb6eb39450f315
>>
>> Which just got merged. Instead of rebasing on Linus' master
>> (which is always a bit adventurous to use during the merge window)
>> you can also cherry-pick that single commit on top of v5.3
>> and use that as a base.
>>
>> Note that that patch makes changes to struct cht_int33fe_data
>> specifically it drops the:
>>
>> =09struct fwnode_handle *mux;
>>
>> Member, so when rebasing you should drop that in the new
>> version of the struct on common.h .
>>
>> Besides that this need a rebase, overall this looks good, I have some
>> small remarks inline:
>=20
> Arghh.. OK, I have rebased the patch but at current torvalds kernel
> i2c_acpi_new_device() fails with -EPROBE_DEFER at my hw, so I cannot chec=
k if it
> is fully working. But I will resend patch anyway soon, this error should
> not be related to the patch content.

Are you sure it is not working? -EPROBE_DEFER is normal(ish) it just means
that the i2c-controller driver for the bus has not initialized yet.

If you are building the i2c_designware or acpi_lpss drivers as module, or i=
f
you are building the intel_cht_int33fe code into the kernel, then this
is more or less expected to happen.

You can do "ls /sys/bus/i2c/devices" to check if it did succeed on
later re-probe attempts (the fuel-gauge device should be there if
things succeeded).

And you should probably do one more version, suppressing the dev_err
on -EPROBE_DEFER like e.g. this snippet from the typec code:

         if (fusb302_irq < 0) {
                 if (fusb302_irq !=3D -EPROBE_DEFER)
                         dev_err(dev, "Error getting FUSB302 irq\n");
                 return fusb302_irq;
         }

Regards,

Hans




>=20
>>> +=09data->hw_type =3D ret;
>>> +=09data->dev =3D dev;
>>> +
>>> +=09switch (data->hw_type) {
>>
>> I suggested adding hw_type to data so that it could be used to
>> select the right remove function in cht_int33fe_remove(),
>> since you are using a remove function pointer in data for this
>> (which is fine), there is no reason to store hw_type in
>> cht_int33fe_data anymore, please drop this and change the
>>
>> =09switch (data->hw_type) {
>>
>> to:
>>
>> =09switch (ret) {
>=20
> OK, sure
>=20
>>
>> p.s.
>>
>> I've done the rebase myself and I'm building a kernel with my re-based v=
ersion of this
>> patch to test it on a typec device. I will get back to you with the resu=
lts
>> (I expect things will just work, just making sure).
>>
>=20
