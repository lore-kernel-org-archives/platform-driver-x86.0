From: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/8] mm/memory_hotplug: Rename mhp_restrictions to mhp_modifiers
Date: Wed, 8 Jan 2020 20:08:07 +0100
Message-ID: <5D5ED235-EB67-4072-8CCA-C046B7EC031C@redhat.com>
References: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Williams <dan.j.williams@intel.com>
Cc: Logan Gunthorpe <logang@deltatee.com>, David Hildenbrand <david@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-ia64@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, Linux-sh <linux-sh@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.h>
List-Id: platform-driver-x86.vger.kernel.org



> Am 08.01.2020 um 20:00 schrieb Dan Williams <dan.j.williams@intel.com>:
>=20
> =EF=BB=BFOn Wed, Jan 8, 2020 at 9:17 AM Logan Gunthorpe <logang@deltatee.c=
om> wrote:
>>=20
>>=20
>>=20
>>> On 2020-01-08 5:28 a.m., David Hildenbrand wrote:
>>> On 07.01.20 21:59, Logan Gunthorpe wrote:
>>>> The mhp_restrictions struct really doesn't specify anything resembling
>>>> a restriction anymore so rename it to be mhp_modifiers.
>>>=20
>>> I wonder if something like "mhp_params" would be even better. It's
>>> essentially just a way to avoid changing call chains rough-out all archs=

>>> whenever we want to add a new parameter.
>>=20
>> Sure, that does sound a bit nicer to me. I can change it for v3.
>=20
> Oh, I was just about to chime in to support "modifiers" because I
> would expect all parameters to folded into a "params" struct. The
> modifiers seem to be limited to the set of items that are only
> considered in a non-default / expert memory hotplug use cases.
>=20

It=E2=80=98s a set of extended parameters I=E2=80=98d say.=20=
