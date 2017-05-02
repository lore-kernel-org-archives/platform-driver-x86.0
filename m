From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Subject: Re: [PATCH 1/4] PCI: add resizeable BAR infrastructure v4
Date: Tue, 2 May 2017 16:56:55 +0200
Message-ID: <bd126097-1aa4-eeb0-39fd-2e8820b448c5@vodafone.de>
References: <1493126394-1239-1-git-send-email-deathsimple@vodafone.de>
 <1493126394-1239-2-git-send-email-deathsimple@vodafone.de>
 <CAHp75VfJKkFTXbia=CiZapriEg6ObUh=js6cKJv3xe=2DBHbqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAHp75VfJKkFTXbia=CiZapriEg6ObUh=js6cKJv3xe=2DBHbqA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, helgaas@kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

QW0gMjYuMDQuMjAxNyB1bSAxODo0NSBzY2hyaWViIEFuZHkgU2hldmNoZW5rbzoKPiBbU05JUF0K
Pj4gLSNkZWZpbmUgIFBDSV9SRUJBUl9DVFJMX05CQVJfTUFTSyAgICAgICg3IDw8IDUpICAgICAg
ICAvKiBtYXNrIGZvciAjIGJhcnMgKi8KPj4gLSNkZWZpbmUgIFBDSV9SRUJBUl9DVFJMX05CQVJf
U0hJRlQgICAgIDUgICAgICAgLyogc2hpZnQgZm9yICMgYmFycyAqLwo+PiArI2RlZmluZSAgUENJ
X1JFQkFSX0NUUkxfTkJBUl9NQVNLICAgICAgKDcgPDwgNSkgICAgICAgIC8qIG1hc2sgZm9yICMg
QkFScyAqLwo+PiArI2RlZmluZSAgUENJX1JFQkFSX0NUUkxfTkJBUl9TSElGVCAgICAgNSAgICAg
ICAvKiBzaGlmdCBmb3IgIyBCQVJzICovCj4gSSB1bmRlcnN0YW5kIHdoeSwgYnV0IEkgZHVubm8g
aXQgd29ydGggdG8gZG8uCkJqb3JuIHN1Z2dlc3RlZCB0aGF0LiBFaXRoZXIgd2F5IGlzIGZpbmUg
d2l0aCBtZSwgYnV0IGhlIG5lZWRzIHRvIHN0aWNrIApoaXMgc2lnbmVkLW9mLWJ5IG9uIGl0IHdo
ZW4gcHVzaGluZyBpdCB1cHN0cmVhbS4gU28gaGlzIG9waW5pb24gdXN1YWxseSAKd2lucy4KCkFs
bCBvdGhlciBjb21tZW50cyB3aWxsIGJlIGludGVncmF0ZWQgaW4gdGhlIG5leHQgdmVyc2lvbiBv
ZiB0aGUgcGF0Y2guCgpUaGFua3MgZm9yIHRoZSByZXZpZXcsCkNocmlzdGlhbi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
