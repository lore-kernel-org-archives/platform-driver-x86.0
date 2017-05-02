From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/4] PCI: add functionality for resizing resources v3
Date: Tue, 2 May 2017 23:27:02 +0300
Message-ID: <CAHp75VetWKfWWm1gwpd_KjhbXXV-cb1F=DvPVXPKy6v7x6hsBw@mail.gmail.com>
References: <1493126394-1239-1-git-send-email-deathsimple@vodafone.de>
 <1493126394-1239-3-git-send-email-deathsimple@vodafone.de>
 <CAHp75VfSFBYgHRsX2JSH0zdSEW8VvXbNMVvBBsD9kKgzGr-v2w@mail.gmail.com> <6238d127-1c70-8235-e247-bb6cb3f4c040@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <6238d127-1c70-8235-e247-bb6cb3f4c040@vodafone.de>
Sender: linux-pci-owner@vger.kernel.org
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <deathsimple@vodafone.de>
Cc: helgaas@kernel.org, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, dri-devel@lists.freedesktop.org, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 2, 2017 at 6:51 PM, Christian K=C3=B6nig <deathsimple@vodafone.=
de> wrote:
> Am 26.04.2017 um 19:00 schrieb Andy Shevchenko:
>> On Tue, Apr 25, 2017 at 4:19 PM, Christian K=C3=B6nig
>> <deathsimple@vodafone.de> wrote:

>>> +int pci_reassign_bridge_resources(struct pci_dev *bridge, unsigned lon=
g
>>> type)
>>> +{
>>> +       const unsigned long type_mask =3D IORESOURCE_IO | IORESOURCE_ME=
M |
>>> +               IORESOURCE_PREFETCH | IORESOURCE_MEM_64;
>>> +
>>
>> Redundant.
>
>
> Redundant, but also a reminder to myself that I wanted to ask something
> about that.

Missed context I suppose. Usually I comment in one word something
obvious, i.e. redundant empty line.
Sorry for missing my point.

> This type_mask is used already three times in this file, shouldn't we add=
 a
> define for that?

Yes, that's wxactly what I commented somewhere (in one of the rest cases).

--=20
With Best Regards,
Andy Shevchenko
