From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
Date: Wed, 18 Sep 2019 14:53:51 +0200
Message-ID: <61df124e-18fc-c047-5490-a6b79cbed85c@redhat.com>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
 <20190918113835.GA16243@kuha.fi.intel.com>
 <20190918115251.GA28946@jeknote.loshitsa1.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190918115251.GA28946@jeknote.loshitsa1.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 18-09-2019 13:52, Yauhen Kharuzhy wrote:
> On Wed, Sep 18, 2019 at 02:38:35PM +0300, Heikki Krogerus wrote:
>> On Tue, Sep 17, 2019 at 10:45:07PM +0300, Yauhen Kharuzhy wrote:
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
>>
>> Sorry, but "Type B" is even more confusing here. Type B refers to the
>> Standard-B USB connector, so _not_ the micro connector family. You can
>> check the connector definitions from the latest USB 3.2 specification.
>> The standard-b definition goes something like this:
>>
>>          "The standard _Type-B_ connector defined by the USB x specifica=
tion."
>>
>> Note that all the five supported connectors are listed in ch5
>> "Mechanical":
>>
>>          Standard-A
>>          Standard-B
>>          Micro-B
>>          Micro-AB
>>          Type-C
>>
>> So what was the problem with names that refer to the micro connector
>> family, for example "micro-ab" or "micro-b"?
>=20
> Only one problem: there is no difference between micro B, micro AB, mini
> B or Standard-B types of connectors from this driver point of view =E2=80=
=93 all
> of them can be used for device charging. Now we have only two kind of
> hardware with INT33FE pseudo-device: with Micro-B and Type-C connectors
> but other kind may exist. TypeB is not standartized but it seemed to me
> a good generalization of "USB connectors to charger connection but not
> Type-C". No problem to change it to other suitable name, 'simple', 'dumb'=
,
> 'non-TypeC' or 'micro-B'. All this names are not ideal.

Since the one non Type-C connector device we has has a micro-B I would just
call the file drivers/platform/x86/intel_cht_int33fe_microb.c and be done
with it.

Regards,

Hans
