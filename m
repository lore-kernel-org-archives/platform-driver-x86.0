From: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v2 2/8] mm/memory_hotplug: Rename mhp_restrictions to
 mhp_modifiers
Date: Wed, 8 Jan 2020 12:29:00 -0700
Message-ID: <1786a855-de7e-f9f9-d9b1-9dbe081e7360@deltatee.com>
References: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
 <5D5ED235-EB67-4072-8CCA-C046B7EC031C@redhat.com>
 <CAPcyv4jJgBm6rhLn2685HN3DnBKB1FO2ONXC1=Aftspu1hiqmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPcyv4jJgBm6rhLn2685HN3DnBKB1FO2ONXC1=Aftspu1hiqmA@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dan Williams <dan.j.williams@intel.com>, David Hildenbrand <david@redhat.com>
Cc: linux-s390 <linux-s390@vger.kernel.org>, Eric Badger <ebadger@gigaio.com>, linux-ia64@vger.kernel.org, Will Deacon <will@kernel.org>, Linux-sh <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

CgpPbiAyMDIwLTAxLTA4IDEyOjEzIHAubS4sIERhbiBXaWxsaWFtcyB3cm90ZToKPiBPbiBXZWQs
IEphbiA4LCAyMDIwIGF0IDExOjA4IEFNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQu
Y29tPiB3cm90ZToKPj4KPj4KPj4KPj4+IEFtIDA4LjAxLjIwMjAgdW0gMjA6MDAgc2NocmllYiBE
YW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT46Cj4+Pgo+Pj4g77u/T24gV2Vk
LCBKYW4gOCwgMjAyMCBhdCA5OjE3IEFNIExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVl
LmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4+IE9uIDIwMjAtMDEtMDggNToyOCBhLm0u
LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+Pj4gT24gMDcuMDEuMjAgMjE6NTksIExvZ2Fu
IEd1bnRob3JwZSB3cm90ZToKPj4+Pj4+IFRoZSBtaHBfcmVzdHJpY3Rpb25zIHN0cnVjdCByZWFs
bHkgZG9lc24ndCBzcGVjaWZ5IGFueXRoaW5nIHJlc2VtYmxpbmcKPj4+Pj4+IGEgcmVzdHJpY3Rp
b24gYW55bW9yZSBzbyByZW5hbWUgaXQgdG8gYmUgbWhwX21vZGlmaWVycy4KPj4+Pj4KPj4+Pj4g
SSB3b25kZXIgaWYgc29tZXRoaW5nIGxpa2UgIm1ocF9wYXJhbXMiIHdvdWxkIGJlIGV2ZW4gYmV0
dGVyLiBJdCdzCj4+Pj4+IGVzc2VudGlhbGx5IGp1c3QgYSB3YXkgdG8gYXZvaWQgY2hhbmdpbmcg
Y2FsbCBjaGFpbnMgcm91Z2gtb3V0IGFsbCBhcmNocwo+Pj4+PiB3aGVuZXZlciB3ZSB3YW50IHRv
IGFkZCBhIG5ldyBwYXJhbWV0ZXIuCj4+Pj4KPj4+PiBTdXJlLCB0aGF0IGRvZXMgc291bmQgYSBi
aXQgbmljZXIgdG8gbWUuIEkgY2FuIGNoYW5nZSBpdCBmb3IgdjMuCj4+Pgo+Pj4gT2gsIEkgd2Fz
IGp1c3QgYWJvdXQgdG8gY2hpbWUgaW4gdG8gc3VwcG9ydCAibW9kaWZpZXJzIiBiZWNhdXNlIEkK
Pj4+IHdvdWxkIGV4cGVjdCBhbGwgcGFyYW1ldGVycyB0byBmb2xkZWQgaW50byBhICJwYXJhbXMi
IHN0cnVjdC4gVGhlCj4+PiBtb2RpZmllcnMgc2VlbSB0byBiZSBsaW1pdGVkIHRvIHRoZSBzZXQg
b2YgaXRlbXMgdGhhdCBhcmUgb25seQo+Pj4gY29uc2lkZXJlZCBpbiBhIG5vbi1kZWZhdWx0IC8g
ZXhwZXJ0IG1lbW9yeSBob3RwbHVnIHVzZSBjYXNlcy4KCj4+Cj4+IEl04oCYcyBhIHNldCBvZiBl
eHRlbmRlZCBwYXJhbWV0ZXJzIEnigJhkIHNheS4KCj4gU3VyZSwgd2UgY2FuIGNhbGwgdGhlbSAi
bWhwX3BhcmFtcyIgYW5kIGp1c3QgY2xhcmlmeSB0aGF0IHRoZXkgYXJlCj4gb3B0aW9uYWwgLyBl
eHRlbmRlZCBpbiB0aGUga2VybmVsLWRvYy4KCldlbGwgcGdwcm90IGlzbid0IGdvaW5nIHRvIGJl
IG9wdGlvbmFsLi4uIEJ1dCBJJ2xsIGFkZCBzb21ldGhpbmcgdG8gdGhlCmtlcm5lbF9kb2MuCgpM
b2dhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
